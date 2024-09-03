//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.19;

import "./interfaces/IMasterChef.sol";
import "./interfaces/IUniswapV2Router02.sol";


import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import {Test, console} from "../../lib/openzeppelin-contracts/lib/forge-std/src/Test.sol";
import "./interfaces/IUniswapV2ERC20.sol";

/**
 * 2024年07月06日10:39:14
 *  部署地址：
 * 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266
 * 部署私钥：
 * 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80
 *  token:
  0x0165878A594ca255338adfa4d48449f69242Eb8F
  weth:
  0xa513E6E4b8f2a923D98304ec87F64353C4D5C853
  factory:
  0x2279B7A0a67DB372996a5FaB50D91eAA73d2eBe6
  router01:
  0x8A791620dd6260079BF849Dc5567aDC3F2FdC318
  swapFunciont: 0x610178dA211FEF7D417bC0e6FeD39F05609AD788
 * @title 
 * @author 
 * @notice 
 */
contract VigalSwap {
    using SafeERC20 for IERC20;

    address public myToken;
    address public router;
    address public weth;

    constructor(address _token, address _router, address _weth) {
        myToken = _token;
        router = _router;
        weth = _weth;
    }

    // 添加流动性，加入的是以太和Token
    function AddLiquidityWithEth(uint tokenAmount) public payable returns (uint amountToken, uint amountETH, uint liquidity){
        IERC20(myToken).approve(router, tokenAmount);
        IERC20(myToken).safeTransferFrom(msg.sender, address(this),tokenAmount);
        // ingnore slippage
        // (uint amountToken, uint amountETH, uint liquidity) = 
        uint tokenMin = tokenAmount - 50 ;
        uint ethMin = (msg.value * 95) / 100; // 减去 20%
        console.log("AddLiquidity, tokenMin:", tokenMin );
        console.log("AddLiquidity, ethMin:", ethMin );

        (amountToken, amountETH,  liquidity) = IUniswapV2Router02(router).addLiquidityETH{value: msg.value}(myToken, tokenAmount, tokenMin, ethMin, msg.sender, block.timestamp);

    }

    // 用 ETH 购买 Token
    function buyToken(uint minTokenAmount) public payable {
        address[] memory path = new address[](2);
        path[0] = weth;
        path[1] = myToken;

        IUniswapV2Router01(router).swapExactETHForTokens{value : msg.value}(minTokenAmount, path, msg.sender, block.timestamp);
    }

    /**
     * function addLiquidity(
        address tokenA,
        address tokenB,
        uint amountADesired,
        uint amountBDesired,
        uint amountAMin,
        uint amountBMin,
        address to,
        uint deadline
    ) external virtual override ensure(deadline) returns (uint amountA, uint amountB, uint liquidity) {
    
     */
    function AddLiquidityByToken(address tokenA, 
    address tokenB, uint amountADesired,
    uint amountBDesired,address to, 
    uint deadline) public payable returns (uint amountA, uint amountB, uint liquidity){
        // uint amountAMin = amountADesired * 97%;
        uint amountAMin = (amountADesired * 95) / 100; 
        uint amountBMin = (amountBDesired * 95) / 100; 
        (amountA, amountB, liquidity) = IUniswapV2Router02(router).addLiquidity(tokenA, tokenB, 
        amountADesired, amountBDesired, amountAMin, amountBMin, to, deadline);
    }

    /**
     * function removeLiquidityETH(
        address token,
        uint liquidity,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline
    ) public virtual override ensure(deadline) returns (uint amountToken, uint amountETH) {
     */

    function removeLiquidity(uint liquidity, uint amountToken, uint amountETH) 
    public returns (uint amountTokenBack, uint amountETHBack){
        // uint amountTokenMin = (amountToken) / 10;
        // uint amountETHMin = (amountETH) / 10;
        
        return IUniswapV2Router02(router).removeLiquidityETH(myToken, liquidity,0, 0, msg.sender, block.timestamp);

    }

}