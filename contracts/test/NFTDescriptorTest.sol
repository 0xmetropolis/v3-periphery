// SPDX-License-Identifier: UNLICENSED
pragma solidity =0.7.6;
pragma abicoder v2;

import '../libraries/NFTDescriptor.sol';
import '../libraries/NFTSVG.sol';
import '../libraries/HexStrings.sol';

contract NFTDescriptorTest {
    using HexStrings for uint256;
    NFTDescriptor public nftDescriptor = new NFTDescriptor();

    function constructTokenURI(NFTDescriptor.ConstructTokenURIParams calldata params)
        public
        pure
        returns (string memory)
    {
        return nftDescriptor.constructTokenURI(params);
    }

    function getGasCostOfConstructTokenURI(NFTDescriptor.ConstructTokenURIParams calldata params)
        public
        view
        returns (uint256)
    {
        uint256 gasBefore = gasleft();
        nftDescriptor.constructTokenURI(params);
        return gasBefore - gasleft();
    }

    function tickToDecimalString(
        int24 tick,
        int24 tickSpacing,
        uint8 token0Decimals,
        uint8 token1Decimals,
        bool flipRatio
    ) public pure returns (string memory) {
        return nftDescriptor.tickToDecimalString(tick, tickSpacing, token0Decimals, token1Decimals, flipRatio);
    }

    function fixedPointToDecimalString(
        uint160 sqrtRatioX96,
        uint8 token0Decimals,
        uint8 token1Decimals
    ) public pure returns (string memory) {
        return nftDescriptor.fixedPointToDecimalString(sqrtRatioX96, token0Decimals, token1Decimals);
    }

    function feeToPercentString(uint24 fee) public pure returns (string memory) {
        return nftDescriptor.feeToPercentString(fee);
    }

    function addressToString(address _address) public pure returns (string memory) {
        return nftDescriptor.addressToString(_address);
    }

    function generateSVGImage(NFTDescriptor.ConstructTokenURIParams memory params) public pure returns (string memory) {
        return nftDescriptor.generateSVGImage(params);
    }

    function tokenToColorHex(address token, uint256 offset) public pure returns (string memory) {
        return nftDescriptor.tokenToColorHex(uint256(token), offset);
    }

    function sliceTokenHex(address token, uint256 offset) public pure returns (uint256) {
        return nftDescriptor.sliceTokenHex(uint256(token), offset);
    }

    function rangeLocation(int24 tickLower, int24 tickUpper) public pure returns (string memory, string memory) {
        return NFTSVG.rangeLocation(tickLower, tickUpper);
    }

    function isRare(uint256 tokenId, address poolAddress) public pure returns (bool) {
        return NFTSVG.isRare(tokenId, poolAddress);
    }
}
