params ["_unit"];

// Only BLUFOR can trigger CWSP
(side _unit) isEqualTo west
