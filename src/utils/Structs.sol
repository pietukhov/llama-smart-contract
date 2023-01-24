// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import {IVertexCore} from "src/core/IVertexCore.sol";
import {IVertexPolicyNFT} from "src/policy/IVertexPolicyNFT.sol";
import {VertexStrategy} from "src/strategy/VertexStrategy.sol";

///@dev Struct to define a permission
struct Permission {
    address target;
    bytes4 signature;
    address executor;
}

struct Approval {
    bool support;
    uint248 weight;
}

struct Disapproval {
    bool support;
    uint248 weight;
}

struct Action {
    uint256 id;
    address creator;
    bool executed;
    bool canceled;
    VertexStrategy strategy;
    address target;
    uint256 value;
    string signature;
    bytes data;
    uint256 createdBlockNumber;
    uint256 approvalEndTime;
    uint256 executionTime;
    uint256 totalApprovals;
    uint256 totalDisapprovals;
    uint256 approvalPolicySupply;
    uint256 disapprovalPolicySupply;
}

struct WeightByPermission {
    bytes32 permissionSignature;
    uint248 weight;
}

struct Strategy {
    uint256 approvalDuration;
    uint256 queuingDuration;
    uint256 expirationDelay;
    bool isFixedLengthApprovalPeriod;
    uint256 minApprovalPct;
    uint256 minDisapprovalPct;
    WeightByPermission[] approvalWeightByPermission;
    WeightByPermission[] disapprovalWeightByPermission;
}
