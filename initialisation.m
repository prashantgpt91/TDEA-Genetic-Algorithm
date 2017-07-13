function [no_op_plan_job,no_mac_plan_job,no_plan_job,machine_time,transport_time]=initialisation()

%name of the function is initialisation and it returns the specified
%variable

no_plan_job=[2 3 6 8 10 13];  %No. of plans per job relative

no_op_plan_job=[3 4 6 4 3 5 3 4 5 3 6 4 3];  % absolute data

no_mac_plan_job=[2 5 6 6 6 6               %relative data
     8 10 12 15 15 15
    16 18 21 23 25 27
    29 31 33 35 35 35
    36 38 39 39 39 39
    41 42 44 46 48 48
    50 52 53 53 53 53
    55 56 58 60 60 60
    61 63 64 65 67 67
    69 70 72 72 72 72
    74 76 78 79 81 83
    85 87 89 90 90 90
    93 95 97 97 97 97];

machine_time=[1 6             %machine id and time taken by it for a given operation for a given job and process plan
    2 5
    3 7
    4 6
    5 6
    6 8
    1 4
    3 5
    2 4
    4 5
    3 5
    5 6
    4 5
    5 5
    6 4
    2 4
    1 2
    3 3
    2 4
    4 3
    6 5
    3 2
    5 4
    2 3
    4 4
    4 3
    6 5
    2 5
    3 6
    1 6
    4 5
    2 5
    5 6
    3 6
    6 5
    1 9
    3 8
    4 8
    5 9
    2 7
    3 6
    4 7
    3 4
    5 6
    4 5
    6 5
    2 6
    4 4
    1 7
    2 8
    3 7
    4 6
    6 9
    1 4
    3 3
    2 4
    3 4
    4 5
    5 3
    6 5
    1 3
    2 4
    4 5
    3 4
    5 3
    4 5
    6 4
    2 5
    4 6
    5 7
    3 9
    6 8
    1 3
    2 4
    3 4
    4 3
    2 5
    5 3
    3 4
    4 4
    5 6
    3 5
    6 4
    1 4
    3 4
    2 5
    3 6
    2 6
    4 7
    6 7
    1 3
    2 5
    3 8
    4 7
    5 10
    3 9
    6 9];

transport_time=[0 1 3 2 3 2       %transportation time between machines
    1 0 2 2 3 3
    3 2 0 2 3 3
    2 2 2 0 2 3
    3 3 3 2 0 2
    2 3 3 3 2 0];


%disp('sab theek hai bhai');



