// SPDX-License-Identifier: UNLICENSED
pragma solidity =0.7.6;
pragma abicoder v2;

import '../libraries/NFTDescriptor.sol';
import '../libraries/NFTSVG.sol';
import '../libraries/HexStrings.sol';

contract NFTDescriptorTest is NFTDescriptor {
    using HexStrings for uint256;

    function getGasCostOfConstructTokenURI(NFTDescriptor.ConstructTokenURIParams calldata params)
        public
        view
        returns (uint256)
    {
        uint256 gasBefore = gasleft();
        constructTokenURI(params);
        return gasBefore - gasleft();
    }

    function tickToDecimalString(
        int24 tick,
        int24 tickSpacing,
        uint8 token0Decimals,
        uint8 token1Decimals,
        bool flipRatio
    ) public pure returns (string memory) {
        return _tickToDecimalString(tick, tickSpacing, token0Decimals, token1Decimals, flipRatio);
    }

    function fixedPointToDecimalString(
        uint160 sqrtRatioX96,
        uint8 token0Decimals,
        uint8 token1Decimals
    ) public pure returns (string memory) {
        return _fixedPointToDecimalString(sqrtRatioX96, token0Decimals, token1Decimals);
    }

    function feeToPercentString(uint24 fee) public pure returns (string memory) {
        return _feeToPercentString(fee);
    }

    function addressToString(address _address) public pure returns (string memory) {
        return _addressToString(_address);
    }

    function generateSVGImage(NFTDescriptor.ConstructTokenURIParams memory params) public pure returns (string memory) {
        return _generateSVGImage(params);
    }

    function tokenToColorHex(address token, uint256 offset) public pure returns (string memory) {
        return _tokenToColorHex(uint256(token), offset);
    }

    function sliceTokenHex(address token, uint256 offset) public pure returns (uint256) {
        return _sliceTokenHex(uint256(token), offset);
    }

    function rangeLocation(int24 tickLower, int24 tickUpper) public pure returns (string memory, string memory) {
        return NFTSVG.rangeLocation(tickLower, tickUpper);
    }

    function isRare(uint256 tokenId, address poolAddress) public pure returns (bool) {
        return NFTSVG.isRare(tokenId, poolAddress);
    }
}
