// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.25;

struct MerkleRootUpdate {
    address owner;
    bytes32 root;
    bytes32 r;
    bytes32 s;
    uint8 v;
}

struct BatchApprove {
    address holder;
    uint256 nonce;
    address token;
    uint256 totalAmount;
    uint256 deadline;
    bytes32 r;
    bytes32 s;
    uint8 v;
}

struct SubApprove {
    bytes32 digest; // main sigature digest
    bytes32 salt;
    uint256 amount;
    bytes32[] merkleProof;
}

interface QRPay {
    function registerToken(address token, bool valid) external;

    function executePayment(MerkleRootUpdate calldata m, BatchApprove calldata b, SubApprove calldata s) external;
}
