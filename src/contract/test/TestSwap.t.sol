pragma solidity ^0.8.19;

import {Test, console} from "../../../lib/openzeppelin-contracts/lib/forge-std/src/Test.sol";
import {MyToken} from "../MyToken.sol";
import { WETH9 } from "../uniswpV2/WETH9.sol";
import { UniswapV2Factory } from "../uniswpV2/UniswapV2Factory.sol";
import { UniswapV2Router02 } from "../uniswpV2/UniswapV2Router02.sol";
import { VigalSwap } from "../VigalSwap.sol";
import { UniswapV2Pair } from "../uniswpV2/UniswapV2Pair.sol";
import "../interfaces/IUniswapV2Pair.sol";
import "../interfaces/IUniswapV2Factory.sol";
import "../interfaces/IUniswapV2ERC20.sol";
import "../interfaces/IWETH.sol";
/**
 * 部署地址：
 * 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266
 * 部署私钥：
 * 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80
 * token:
  0x5FbDB2315678afecb367f032d93F642f64180aa3
  weth:
  0xe7f1725E7734CE288F8367e1Bb143E90bb3F0512
  factory:
  0x9fE46736679d2D9a65F0992F2272dE9f3c7fa6e0
  router01:
  0xCf7Ed3AccA5a467e9e704C703E8D87F634fB0Fc9
  swapFunciont: 0xDc64a140Aa3E981100a9becA4E685f962f0cF6C9
 * @title 
 * @author 
 * @notice 
 */
contract TestSwap is Test{
    MyToken token;
    WETH9 weth;
    UniswapV2Factory factory;
    UniswapV2Router02 router ;
    VigalSwap swapFun;

    function setUp() public {
        vm.startPrank(address(1));
          token = new MyToken();
        console.log("token:");
        console.log(address(token));
        //address _WETH, address _linkOracl) 
         weth = new WETH9();
        console.log("weth:");
        console.log(address(weth));
         factory = new UniswapV2Factory(msg.sender);
        console.log("factory:");
        console.log(address(factory));
         router = new UniswapV2Router02(address(factory), address(weth));
        console.log("router:");
        console.log(address(router));
        bytes32 a = keccak256(type(UniswapV2Pair).creationCode);
        console.log("keccak256");
        console.logBytes32(a);
        // UniswapV2Router02 router2 = new UniswapV2Router02(address(factory), address(weth));
        // console.log("router02:");
        // console.log(address(router2));

         swapFun = new VigalSwap(address(token), address(router), address(weth));
        console.log("swapFun:", address(swapFun));
        vm.stopPrank();
    }

    function testFuzz_AddLiquidity() public {
        // token.approve();
        vm.startPrank(address(1));
        token.approve(address(swapFun), 888888888);
        deal(address(1), 2 ether);
        // token.approve(address(this), 8888);
        (uint amountToken, uint amountETH, uint liquidity) = swapFun.AddLiquidityWithEth{value: 0.1 ether}(888888888);
        console.log("deposite amountToken:", amountToken);
        console.log("deposite amountEth:", amountETH);
        // console.log("liquidity:", liquidity);
        address pairMint = factory.getPair(address(token), address(weth));
        // address pairMint = factory.getPair[address(token)][address(weth)];
        //console.log("pairMint:", pairMint);
        uint balancePair = IUniswapV2ERC20(pairMint).balanceOf(address(1));
       // console.log("balancePair:", balancePair);
        assertEq(balancePair, liquidity);
                // token.transfer(address(2), 9999);
        // assertEq(token.balanceOf(address(2)), 9999);
        vm.stopPrank();

    
        vm.startPrank(address(2));
        deal(address(2), 1 ether);
        swapFun.buyToken{value: 0.01 ether}(5000);
        // console.log("addres2 balance:", token.balanceOf(address(2)));
        // 打印地址eth余额
        // console.log("address2 eth balance:", address(2).balance);
        assertGt(token.balanceOf(address(2)), 5000);
        // address pairMint = factory.getPair(address(token), address(weth));
        // address pairMint = factory.getPair[address(token)][address(weth)];
        // console.log("pairMint:", pairMint);
        // 搞错了，兑换是没有pair的
        // uint balancePair = IUniswapV2ERC20(pairMint).balanceOf(address(2));
        // console.log("balancePair:", balancePair);
        vm.stopPrank();
        vm.startPrank(address(1));
        // removeLiquidity(uint liquidity, uint amountToken, uint amountETH)
        uint balancePair2 = IUniswapV2ERC20(pairMint).balanceOf(address(1));
        console.log("balancePair2:", balancePair2);
        console.log("address1 eth balance:", address(1).balance);
        assertEq(balancePair2, liquidity);
        //搞不明白为什么还不行，打印了是vigalSwap去转的，授权了还是不行。。。
        IUniswapV2ERC20(pairMint).approve(address(swapFun), liquidity+ 10 ** 18);
        IUniswapV2ERC20(pairMint).approve(address(token), liquidity+ 10 ** 18);
        IUniswapV2ERC20(pairMint).approve(address(router), liquidity+ 10 ** 18);
        weth.approve(address(router), liquidity+ 10 ** 18);
        console.log("testSwap amountETH:::",amountETH);
        // 找到问题所在了，burn的时候，_safeTransfer会从合约转账到to，
        // 然后还会withdraw，就是把转账然后从WETH转为eth
        (uint amountTokenBack, uint amountETHBack) = swapFun.removeLiquidity(liquidity, amountToken, amountETH);
        console.log("liquidity:", liquidity);
        console.log("amountTokenBack:", amountTokenBack);
        console.log("amountETHBack:", amountETHBack);
        vm.stopPrank();

    }

    function test_AddLiquidity() public{
        vm.startPrank(address(1));
        vm.deal(address(1), 2 ether);
        /**
         *  address tokenB,
            uint amountADesired,
            uint amountBDesired,
            address to,
            uint deadline) 
            public payable returns (uint amountA,
            uint amountB,
            uint liquidit
         */
        // swapFun.AddLiquidityByToken();

    }

}