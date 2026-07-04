params ["_unit"];

// Covenant/Independent/Opfor are authorized (true). BLUFOR (west) is NOT authorized (false).
!(side _unit isEqualTo west)