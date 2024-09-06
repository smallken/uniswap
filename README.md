# Uniswap V2

## 1. 新建一个foundry项目

初始化: `forge init uniswap`

引入: `forge install Openzeppelin/openzeppelin-contracts`

引入的依赖报找不到：`forge remappings > remappings.txt`

## 2. 测试

`forge test --match-test testFuzz_AddLiquidity --fork-url $ANVIL_RPC_URL -vvv summary`

测试成功的：

```
Running 1 test for src/contract/test/TestSwap.t.sol:TestSwap
[PASS] testFuzz_AddLiquidity() (gas: 2702901)
Logs:
  token:
  0x522B3294E6d06aA25Ad0f1B8891242E335D3B459
  weth:
  0x535B3D7A252fa034Ed71F0C53ec0C6F784cB64E1
  factory:
  0xc051134F56d56160E8c8ed9bB3c439c78AB27cCc
  router:
  0x2c1DE3b4Dbb4aDebEbB5dcECAe825bE2a9fc6eb6
  keccak256
  0xeb5ff2a1e8b07d3ad82f50c7929083f581bdbf0aec7e97263771e6e583feca21
  swapFun: 0x83769BeEB7e5405ef0B7dc3C66C43E3a51A6d27f
  AddLiquidity, tokenMin: 888888838
  AddLiquidity, ethMin: 95000000000000000
  UniswapV2Pair, constructor msg sender: 0xc051134F56d56160E8c8ed9bB3c439c78AB27cCc
  create pair: 0x711e6A2c17546669d29D03bD771F49F3DB54b9D4
  createPair finished: 0xc051134F56d56160E8c8ed9bB3c439c78AB27cCc 0x522B3294E6d06aA25Ad0f1B8891242E335D3B459 0x535B3D7A252fa034Ed71F0C53ec0C6F784cB64E1
  0xc051134F56d56160E8c8ed9bB3c439c78AB27cCc 0x522B3294E6d06aA25Ad0f1B8891242E335D3B459 0x535B3D7A252fa034Ed71F0C53ec0C6F784cB64E1
  getInto getResrves 0x711e6A2c17546669d29D03bD771F49F3DB54b9D4
  in getReserves(), 0
  getReserves: 0
  blockTimestampLast:
  0
  IUniswapV2Pair: 0 0
  createPair finished:reserveA == 0 && reserveB == ,amountADesired 888888888
  amountBDesired 100000000000000000
  Token: 0x522B3294E6d06aA25Ad0f1B8891242E335D3B459
  From: 0x83769BeEB7e5405ef0B7dc3C66C43E3a51A6d27f
  To: 0x711e6A2c17546669d29D03bD771F49F3DB54b9D4
  Value: 888888888
  msg.sender: 0x83769BeEB7e5405ef0B7dc3C66C43E3a51A6d27f
  allowance: 0
  weth9 transferFro msg.sender: 0x2c1DE3b4Dbb4aDebEbB5dcECAe825bE2a9fc6eb6
  weth9, src: 0x2c1DE3b4Dbb4aDebEbB5dcECAe825bE2a9fc6eb6
  in getReserves(), 0
  getReserves: 0
  blockTimestampLast:
  0
  deposite amountToken: 888888888
  deposite amountEth: 100000000000000000
  swapExactETHForTokens path length: 2
  router swapExactETHForTokens msg.value: 10000000000000000
  Library amountIn: 10000000000000000
   Library amounts[0]: 0
  0xc051134F56d56160E8c8ed9bB3c439c78AB27cCc 0x535B3D7A252fa034Ed71F0C53ec0C6F784cB64E1 0x522B3294E6d06aA25Ad0f1B8891242E335D3B459
  getInto getResrves 0x711e6A2c17546669d29D03bD771F49F3DB54b9D4
  in getReserves(), 888888888
  getReserves: 888888888
  blockTimestampLast:
  1724989921
  IUniswapV2Pair: 888888888 100000000000000000
  [amounts.length - 1]: 80587634
  amountOutMin: 5000
  contract balance: 0
  amounts[0]: 10000000000000000
  weth9 transferFro msg.sender: 0x2c1DE3b4Dbb4aDebEbB5dcECAe825bE2a9fc6eb6
  weth9, src: 0x2c1DE3b4Dbb4aDebEbB5dcECAe825bE2a9fc6eb6
  in getReserves(), 888888888
  getReserves: 888888888
  blockTimestampLast:
  1724989921
  _safeTransfer token: 0x522B3294E6d06aA25Ad0f1B8891242E335D3B459
  _safeTransfer to: 0x0000000000000000000000000000000000000002
  _safeTransfer value: 80587634
  balancePair2: 9428090410106
  address1 eth balance: 1900000000000000000
  testSwap amountETH::: 100000000000000000
  pair::: 0x711e6A2c17546669d29D03bD771F49F3DB54b9D4
  address to:::: 0x0000000000000000000000000000000000000001
  pair to balance:::: 9428090410106
  address this before pair balance:::: 808301254
  pair::: 0x711e6A2c17546669d29D03bD771F49F3DB54b9D4
  removeLiquidity,address: 0x83769BeEB7e5405ef0B7dc3C66C43E3a51A6d27f
  pair sender balance 0
  pair to balance 9428090410106
  allowance: 0
  transferFrom start
  pair.burn
  in getReserves(), 808301254
  getReserves: 808301254
  blockTimestampLast:
  1724989921
  _safeTransfer token: 0x522B3294E6d06aA25Ad0f1B8891242E335D3B459
  _safeTransfer to: 0x0000000000000000000000000000000000000001
  _safeTransfer value: 808301253
  _safeTransfer token: 0x535B3D7A252fa034Ed71F0C53ec0C6F784cB64E1
  _safeTransfer to: 0x0000000000000000000000000000000000000001
  _safeTransfer value: 109999999988332738
  weth9 transferFro msg.sender: 0x711e6A2c17546669d29D03bD771F49F3DB54b9D4
  weth9, src: 0x711e6A2c17546669d29D03bD771F49F3DB54b9D4
  sortTokens
  to weth balance:::: 109999999988332738
  weth contract balance:::: 0
  weth9 transferFro msg.sender: 0x2c1DE3b4Dbb4aDebEbB5dcECAe825bE2a9fc6eb6
  weth9, src: 0x0000000000000000000000000000000000000001
  msg.sender: 0x2c1DE3b4Dbb4aDebEbB5dcECAe825bE2a9fc6eb6
  liquidity: 9428090410106
  amountTokenBack: 808301253
  amountETHBack: 109999999988332738

Test result: ok. 1 passed; 0 failed; 0 skipped; finished in 451.96ms
 
Ran 1 test suites: 1 tests passed, 0 failed, 0 skipped (1 total tests)


Test Summary:

╭------------+--------+--------+---------╮
| Test Suite | Passed | Failed | Skipped |
+========================================+
| TestSwap   |    1   |    0   |    0    |
╰------------+--------+--------+---------╯
```



上面测试了接口是 swapFun.AddLiquidityWithEth，Swap和移除流动性的。

## 3.  代码分析

主要研究这几个函数：增加流动性、移除流动站、兑换

#### 3.1 增加流动性

输入的有Token地址，token期望的数量，滑点的Token数和以太数，增加流动性地址，deadline.

>我理解的思路是，把两个token存到pair合约里，然后算出amoutA和amoutB, 返回lp Token给质押者，并且会把手续费还给质押者；这时候会更新x*y=k， 这个k的总量;
>
>当有用户进行兑换的时候，k是保持不变的，(x+x1)*(y-y1)=k, 要的是y1= y-k/(x+x1)

1. 先获取了流动性的数量：token和eth的；
2. 获取Pair，在addLiqudity里，如果没有pair，就会创建；
3.  转账token到pair
4. 由ETH转为WETH
5. 转WETH到去pair
6. mint pair 到to地址
7. 把多出来的eth转回，好像是多的转回ETH
          

```solidity
function addLiquidityETH(
        address token,
        uint amountTokenDesired,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline
    ) external virtual override payable ensure(deadline) returns (uint amountToken, uint amountETH, uint liquidity) {
        //这里不转账，只是获取添加流动性的总量而已
        (amountToken, amountETH) = _addLiquidity(
            token,
            WETH,
            amountTokenDesired,
            msg.value,
            amountTokenMin,
            amountETHMin
        );
        // 获取Pair
        address pair = UniswapV2Library.pairFor(factory, token, WETH);
        // 转账token到pair
        TransferHelper.safeTransferFrom(token, msg.sender, pair, amountToken);
        // 这个是由ETH转为WETH，很神奇的是自动转
        IWETH(WETH).deposit{value: amountETH}();
        // 转WETH到去pair
        assert(IWETH(WETH).transfer(pair, amountETH));
        // mint pair 到to地址
        liquidity = IUniswapV2Pair(pair).mint(to);
        // refund dust eth, if any
        // 把多出来的eth转回，好像是多的转回ETH
        if (msg.value > amountETH) TransferHelper.safeTransferETH(msg.sender, msg.value - amountETH);
    }
```

然后说说这个函数：

```solidity
// mint pair 到to地址
liquidity = IUniswapV2Pair(pair).mint(to);

 function mint(address to) external lock returns (uint liquidity) {
        // 获取存量
        (uint112 _reserve0, uint112 _reserve1,) = getReserves(); // gas savings
        // token0一开始就初始化了
        uint balance0 = IERC20(token0).balanceOf(address(this));
        uint balance1 = IERC20(token1).balanceOf(address(this));
        // sub是balance0减去reserve0，这里做了安全校验
        // amount0是减掉的，就是合约存有的token0数量减去存量
        uint amount0 = balance0.sub(_reserve0);
        uint amount1 = balance1.sub(_reserve1);

        bool feeOn = _mintFee(_reserve0, _reserve1);
        uint _totalSupply = totalSupply; // gas savings, must be defined here since totalSupply can update in _mintFee
        if (_totalSupply == 0) {
        //             liquidity = Math.sqrt(amount0.mul(amount1)).sub(MINIMUM_LIQUIDITY);
        // 这个amount0.mul(amount1)是 amount0*amount1 ,得到结果b， 再开平b ,最后减-MINIMUM_LIQUIDITY
        
            liquidity = Math.sqrt(amount0.mul(amount1)).sub(MINIMUM_LIQUIDITY);
           _mint(address(0), MINIMUM_LIQUIDITY); // permanently lock the first MINIMUM_LIQUIDITY tokens
        } else {
        // amount0.mul(_totalSupply) / _reserve0, amount1.mul(_totalSupply) / _reserve1
        // 是在上两个数找个小的，amount0*_totalSupply, 再除以reserve
            liquidity = Math.min(amount0.mul(_totalSupply) / _reserve0, amount1.mul(_totalSupply) / _reserve1);
        }
        require(liquidity > 0, 'UniswapV2: INSUFFICIENT_LIQUIDITY_MINTED');
        _mint(to, liquidity);

        _update(balance0, balance1, _reserve0, _reserve1);
        if (feeOn) kLast = uint(reserve0).mul(reserve1); // reserve0 and reserve1 are up-to-date
        emit Mint(msg.sender, amount0, amount1);
    }
```

终于搞明白了，这个reserve是存量，也就是记录保存在合约的token数量，而实际存在的是token里面，balance记录者，调token.balanceOf(pair)就可以查到了。所以，当Mint的时候，balance会先改变，balance0-_reserve0，就会得到新增的量。

再看看这段函数：

```solidity
function _update(uint balance0, uint balance1, uint112 _reserve0, uint112 _reserve1) private {
        require(balance0 <= type(uint112).max && balance1 <= type(uint112).max, 'UniswapV2: OVERFLOW');
        uint32 blockTimestamp = uint32(block.timestamp % 2**32);
        uint32 timeElapsed = blockTimestamp - blockTimestampLast; // overflow is desired
        if (timeElapsed > 0 && _reserve0 != 0 && _reserve1 != 0) {
            // * never overflows, and + overflow is desired
            price0CumulativeLast += uint(UQ112x112.encode(_reserve1).uqdiv(_reserve0)) * timeElapsed;
            price1CumulativeLast += uint(UQ112x112.encode(_reserve0).uqdiv(_reserve1)) * timeElapsed;
        }
        reserve0 = uint112(balance0);
        reserve1 = uint112(balance1);
        blockTimestampLast = blockTimestamp;
        emit Sync(reserve0, reserve1);
    }
```



这是更新存量的函数，这里更新：

```
 reserve0 = uint112(balance0);
 reserve1 = uint112(balance1);
```

然后这里用了时间加权：

```
if (timeElapsed > 0 && _reserve0 != 0 && _reserve1 != 0) {
            // * never overflows, and + overflow is desired
            price0CumulativeLast += uint(UQ112x112.encode(_reserve1).uqdiv(_reserve0)) * timeElapsed;
            price1CumulativeLast += uint(UQ112x112.encode(_reserve0).uqdiv(_reserve1)) * timeElapsed;
        }
```

`UQ112x112.encode(_reserve1).uqdiv(_reserve0)`这个是除法，也就是`_reserve1/_reserve0`，再乘以时间，时间越长，时间权重越高。

总结下增加流动性，这里是平台token和ETH，首先是把TokenA和TokenB的数量返回，通过计算；然后获得pair地址，把token转过去pair地址，然后把eth转为WETH，再转过去pair合约；接着mint 代币lp给质押者，最后把多余的eth转回给质押者。

再继续解析，就是具体里面函数的解释里面的mint，其中获取流动性：`            liquidity = Math.min(amount0.mul(_totalSupply) / _reserve0, amount1.mul(_totalSupply) / _reserve1);`，这里是amount0/_reserve0乘以总量（UniswapV2ERC20记录了lp的总量，lp代币其实就是UniswapV2ERC20这个合约）；也就是amount占比总的多少，再乘以目前lp的总量，然后两个币去最小值，就是该账户获得的Lp代币数量；然后才`        _mint(to, liquidity);，最后，如果feeton，就`        if (feeOn) kLast = uint(reserve0).mul(reserve1); // reserve0 and reserve1 are up-to-date`，很奇怪会有feeOn为false的情况，如果这样就不会更新这个kLast值了。

有个疑问，就是什么时候创建的pair，增加流动性这里不过是预先知道了pair地址，没有去创建。原来是这，调了函数_addLiquidity：

```
if (IUniswapV2Factory(factory).getPair(tokenA, tokenB) == address(0)) {
            IUniswapV2Factory(factory).createPair(tokenA, tokenB);
   }
```

```solidity
function createPair(address tokenA, address tokenB) external returns (address pair) {
        require(tokenA != tokenB, 'UniswapV2: IDENTICAL_ADDRESSES');
        (address token0, address token1) = tokenA < tokenB ? (tokenA, tokenB) : (tokenB, tokenA);
        require(token0 != address(0), 'UniswapV2: ZERO_ADDRESS');
        require(getPair[token0][token1] == address(0), 'UniswapV2: PAIR_EXISTS'); // single check is sufficient
        bytes memory bytecode = type(UniswapV2Pair).creationCode;
        // console.log("createPair,bytecode:::");
        // console.logBytes32(bytecode);
        bytes32 salt = keccak256(abi.encodePacked(token0, token1));
        assembly {
            pair := create2(0, add(bytecode, 32), mload(bytecode), salt)
        }
        IUniswapV2Pair(pair).initialize(token0, token1);
        getPair[token0][token1] = pair;
        getPair[token1][token0] = pair; // populate mapping in the reverse direction
        allPairs.push(pair);
        console.log("create pair:", pair);
        emit PairCreatedFactory(token0, token1, pair, allPairs.length);
    }
```

createPair中，用了汇编的方式创建了合约。

#### 3.2 兑换



