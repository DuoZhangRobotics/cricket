namespace ppln::collision {

#define DUAL_UR5E_APPROX_SPHERE_COUNT 142
#define DUAL_UR5E_APPROX_JOINT_COUNT 13
#define DUAL_UR5E_APPROX_SELF_CC_RANGE_COUNT 86
#define FIXED -1
#define X_PRISM 0
#define Y_PRISM 1
#define Z_PRISM 2
#define X_ROT 3
#define Y_ROT 4
#define Z_ROT 5
#define BATCH_SIZE 16

__device__ __constant__ float4 dual_ur5e_approx_spheres_array[142] = {
    {-0.550003f, 1e-06f, 0.049546f, 0.090364f},
    {-3e-06f, -0.006649f, -0.001514f, 0.089842f},
    {-0.298805f, -2.2e-05f, 0.130656f, 0.094923f},
    {-0.422387f, -2.9e-05f, 0.129005f, 0.091263f},
    {-0.008711f, 6e-06f, 0.135378f, 0.090758f},
    {-0.370304f, -2.5e-05f, 0.131606f, 0.093838f},
    {-0.087952f, -3e-06f, 0.13542f, 0.092897f},
    {-0.221208f, -1.6e-05f, 0.132928f, 0.093117f},
    {-0.158663f, -1.2e-05f, 0.131799f, 0.089958f},
    {-0.375346f, -0.000304f, -0.011401f, 0.069786f},
    {-0.37299f, 0.000759f, 0.022953f, 0.073418f},
    {-0.295291f, -0.000411f, 0.009998f, 0.081417f},
    {-0.214257f, 0.000433f, 0.014403f, 0.085647f},
    {-0.123633f, 0.000247f, 0.012469f, 0.087811f},
    {-0.0451f, 0.001873f, 0.014119f, 0.086674f},
    {0.00852f, 0.010306f, 0.027016f, 0.066154f},
    {0.007854f, -0.011543f, 0.026729f, 0.070424f},
    {-0.000269f, -0.002284f, -0.013745f, 0.076148f},
    {-0.000228f, 0.000455f, -0.001258f, 0.069339f},
    {-0.000229f, -0.00018f, -0.022867f, 0.044717f},
    {-1e-06f, -1e-06f, 0.039762f, 0.053503f},
    {-0.0f, -0.032898f, 0.055274f, 0.011261f},
    {-0.0f, -0.047209f, 0.056403f, 0.013955f},
    {0.0f, -0.057371f, 0.056696f, 0.014264f},
    {0.005135f, -0.067632f, 0.093433f, 0.013081f},
    {-0.007378f, -0.067212f, 0.090199f, 0.014548f},
    {0.006824f, -0.064663f, 0.070548f, 0.01525f},
    {-0.007378f, -0.063899f, 0.064656f, 0.014756f},
    {0.000242f, -0.062279f, 0.052114f, 0.014265f},
    {-9e-06f, -0.065184f, 0.099282f, 0.01218f},
    {-8e-06f, -0.055765f, 0.104099f, 0.01124f},
    {-0.00049f, -0.05289f, 0.114141f, 0.010284f},
    {-8e-06f, -0.05181f, 0.106613f, 0.011778f},
    {0.000153f, -0.05284f, 0.125157f, 0.009281f},
    {-0.003606f, -0.052739f, 0.13621f, 0.008271f},
    {0.003611f, -0.052739f, 0.136261f, 0.008221f},
    {-0.0f, -0.049181f, 0.154075f, 0.015281f},
    {-0.0f, -0.049181f, 0.119074f, 0.015281f},
    {-0.000205f, -0.049181f, 0.142407f, 0.014664f},
    {0.000261f, -0.049181f, 0.129892f, 0.014593f},
    {-0.010146f, -0.016295f, 0.065629f, 0.01486f},
    {0.009674f, -0.015298f, 0.064462f, 0.014049f},
    {0.008911f, -0.028403f, 0.079806f, 0.015606f},
    {-0.011381f, -0.031605f, 0.083558f, 0.015752f},
    {0.009018f, -0.044138f, 0.098231f, 0.015341f},
    {-0.005911f, -0.046991f, 0.101571f, 0.01437f},
    {0.010146f, 0.016295f, 0.065629f, 0.01486f},
    {-0.009674f, 0.015298f, 0.064462f, 0.014049f},
    {-0.008911f, 0.028403f, 0.079806f, 0.015606f},
    {0.011381f, 0.031605f, 0.083558f, 0.015752f},
    {-0.009018f, 0.044138f, 0.098231f, 0.015341f},
    {0.005911f, 0.046991f, 0.101571f, 0.01437f},
    {-0.0f, 0.032898f, 0.055274f, 0.011261f},
    {-0.0f, 0.047209f, 0.056403f, 0.013955f},
    {-0.0f, 0.057371f, 0.056696f, 0.014264f},
    {-0.005135f, 0.067632f, 0.093433f, 0.013081f},
    {0.007378f, 0.067212f, 0.090199f, 0.014548f},
    {-0.006824f, 0.064663f, 0.070548f, 0.01525f},
    {0.007378f, 0.063899f, 0.064656f, 0.014756f},
    {-0.000242f, 0.062279f, 0.052114f, 0.014265f},
    {9e-06f, 0.065184f, 0.099282f, 0.01218f},
    {8e-06f, 0.055765f, 0.104099f, 0.01124f},
    {0.00049f, 0.05289f, 0.114141f, 0.010284f},
    {8e-06f, 0.05181f, 0.106613f, 0.011778f},
    {-0.000153f, 0.05284f, 0.125157f, 0.009281f},
    {0.003606f, 0.052739f, 0.13621f, 0.008271f},
    {-0.003611f, 0.052739f, 0.136261f, 0.008221f},
    {-0.0f, 0.049181f, 0.154075f, 0.015281f},
    {-0.0f, 0.049181f, 0.119074f, 0.015281f},
    {0.000205f, 0.049181f, 0.142407f, 0.014664f},
    {-0.000261f, 0.049181f, 0.129892f, 0.014593f},
    {0.549622f, 0.025881f, 0.049546f, 0.090364f},
    {-3e-06f, -0.006649f, -0.001514f, 0.089842f},
    {-0.298805f, -2.2e-05f, 0.130656f, 0.094923f},
    {-0.422387f, -2.9e-05f, 0.129005f, 0.091263f},
    {-0.008711f, 6e-06f, 0.135378f, 0.090758f},
    {-0.370304f, -2.5e-05f, 0.131606f, 0.093838f},
    {-0.087952f, -3e-06f, 0.13542f, 0.092897f},
    {-0.221208f, -1.6e-05f, 0.132928f, 0.093117f},
    {-0.158663f, -1.2e-05f, 0.131799f, 0.089958f},
    {-0.375346f, -0.000304f, -0.011401f, 0.069786f},
    {-0.37299f, 0.000759f, 0.022953f, 0.073418f},
    {-0.295291f, -0.000411f, 0.009998f, 0.081417f},
    {-0.214257f, 0.000433f, 0.014403f, 0.085647f},
    {-0.123633f, 0.000247f, 0.012469f, 0.087811f},
    {-0.0451f, 0.001873f, 0.014119f, 0.086674f},
    {0.00852f, 0.010306f, 0.027016f, 0.066154f},
    {0.007854f, -0.011543f, 0.026729f, 0.070424f},
    {-0.000269f, -0.002284f, -0.013745f, 0.076148f},
    {-0.000228f, 0.000455f, -0.001258f, 0.069339f},
    {-0.000229f, -0.00018f, -0.022867f, 0.044717f},
    {-1e-06f, -1e-06f, 0.039762f, 0.053503f},
    {-0.0f, -0.032898f, 0.055274f, 0.011261f},
    {-0.0f, -0.047209f, 0.056403f, 0.013955f},
    {0.0f, -0.057371f, 0.056696f, 0.014264f},
    {0.005135f, -0.067632f, 0.093433f, 0.013081f},
    {-0.007378f, -0.067212f, 0.090199f, 0.014548f},
    {0.006824f, -0.064663f, 0.070548f, 0.01525f},
    {-0.007378f, -0.063899f, 0.064656f, 0.014756f},
    {0.000242f, -0.062279f, 0.052114f, 0.014265f},
    {-9e-06f, -0.065184f, 0.099282f, 0.01218f},
    {-8e-06f, -0.055765f, 0.104099f, 0.01124f},
    {-0.00049f, -0.05289f, 0.114141f, 0.010284f},
    {-8e-06f, -0.05181f, 0.106613f, 0.011778f},
    {0.000153f, -0.05284f, 0.125157f, 0.009281f},
    {-0.003606f, -0.052739f, 0.13621f, 0.008271f},
    {0.003611f, -0.052739f, 0.136261f, 0.008221f},
    {-0.0f, -0.049181f, 0.154075f, 0.015281f},
    {-0.0f, -0.049181f, 0.119074f, 0.015281f},
    {-0.000205f, -0.049181f, 0.142407f, 0.014664f},
    {0.000261f, -0.049181f, 0.129892f, 0.014593f},
    {-0.010146f, -0.016295f, 0.065629f, 0.01486f},
    {0.009674f, -0.015298f, 0.064462f, 0.014049f},
    {0.008911f, -0.028403f, 0.079806f, 0.015606f},
    {-0.011381f, -0.031605f, 0.083558f, 0.015752f},
    {0.009018f, -0.044138f, 0.098231f, 0.015341f},
    {-0.005911f, -0.046991f, 0.101571f, 0.01437f},
    {0.010146f, 0.016295f, 0.065629f, 0.01486f},
    {-0.009674f, 0.015298f, 0.064462f, 0.014049f},
    {-0.008911f, 0.028403f, 0.079806f, 0.015606f},
    {0.011381f, 0.031605f, 0.083558f, 0.015752f},
    {-0.009018f, 0.044138f, 0.098231f, 0.015341f},
    {0.005911f, 0.046991f, 0.101571f, 0.01437f},
    {-0.0f, 0.032898f, 0.055274f, 0.011261f},
    {-0.0f, 0.047209f, 0.056403f, 0.013955f},
    {-0.0f, 0.057371f, 0.056696f, 0.014264f},
    {-0.005135f, 0.067632f, 0.093433f, 0.013081f},
    {0.007378f, 0.067212f, 0.090199f, 0.014548f},
    {-0.006824f, 0.064663f, 0.070548f, 0.01525f},
    {0.007378f, 0.063899f, 0.064656f, 0.014756f},
    {-0.000242f, 0.062279f, 0.052114f, 0.014265f},
    {9e-06f, 0.065184f, 0.099282f, 0.01218f},
    {8e-06f, 0.055765f, 0.104099f, 0.01124f},
    {0.00049f, 0.05289f, 0.114141f, 0.010284f},
    {8e-06f, 0.05181f, 0.106613f, 0.011778f},
    {-0.000153f, 0.05284f, 0.125157f, 0.009281f},
    {0.003606f, 0.052739f, 0.13621f, 0.008271f},
    {-0.003611f, 0.052739f, 0.136261f, 0.008221f},
    {-0.0f, 0.049181f, 0.154075f, 0.015281f},
    {-0.0f, 0.049181f, 0.119074f, 0.015281f},
    {0.000205f, 0.049181f, 0.142407f, 0.014664f},
    {-0.000261f, 0.049181f, 0.129892f, 0.014593f}};

__device__ __constant__ float dual_ur5e_approx_fixed_transforms[] = {
    // joint 0
    1.0,
    0.0,
    0.0,
    0.0,
    0.0,
    1.0,
    0.0,
    0.0,
    0.0,
    0.0,
    1.0,
    0.0,
    0.0,
    0.0,
    0.0,
    1.0,

    // joint 1
    -1.0,
    -0.0,
    0.0,
    -0.55,
    0.0,
    -1.0,
    0.0,
    0.0,
    0.0,
    0.0,
    1.0,
    0.1625,
    0.0,
    0.0,
    0.0,
    1.0,

    // joint 2
    1.0,
    0.0,
    0.0,
    0.0,
    0.0,
    -0.0,
    -1.0,
    0.0,
    0.0,
    1.0,
    -0.0,
    0.0,
    0.0,
    0.0,
    0.0,
    1.0,

    // joint 3
    1.0,
    0.0,
    0.0,
    -0.425,
    0.0,
    1.0,
    0.0,
    0.0,
    0.0,
    0.0,
    1.0,
    0.0,
    0.0,
    0.0,
    0.0,
    1.0,

    // joint 4
    1.0,
    0.0,
    0.0,
    -0.3922,
    0.0,
    1.0,
    0.0,
    0.0,
    0.0,
    0.0,
    1.0,
    0.1333,
    0.0,
    0.0,
    0.0,
    1.0,

    // joint 5
    1.0,
    0.0,
    0.0,
    0.0,
    0.0,
    -0.0,
    -1.0,
    -0.0997,
    0.0,
    1.0,
    -0.0,
    -0.0,
    0.0,
    0.0,
    0.0,
    1.0,

    // joint 6
    1.0,
    -0.0,
    0.0,
    0.0,
    -0.0,
    -0.0,
    1.0,
    0.0996,
    -0.0,
    -1.0,
    -0.0,
    -0.0,
    0.0,
    0.0,
    0.0,
    1.0,

    // joint 7
    0.999343,
    -0.036239,
    0.0,
    0.549619,
    0.036239,
    0.999343,
    0.0,
    0.025882,
    0.0,
    0.0,
    1.0,
    0.1625,
    0.0,
    0.0,
    0.0,
    1.0,

    // joint 8
    1.0,
    0.0,
    0.0,
    0.0,
    0.0,
    -0.0,
    -1.0,
    0.0,
    0.0,
    1.0,
    -0.0,
    0.0,
    0.0,
    0.0,
    0.0,
    1.0,

    // joint 9
    1.0,
    0.0,
    0.0,
    -0.425,
    0.0,
    1.0,
    0.0,
    0.0,
    0.0,
    0.0,
    1.0,
    0.0,
    0.0,
    0.0,
    0.0,
    1.0,

    // joint 10
    1.0,
    0.0,
    0.0,
    -0.3922,
    0.0,
    1.0,
    0.0,
    0.0,
    0.0,
    0.0,
    1.0,
    0.1333,
    0.0,
    0.0,
    0.0,
    1.0,

    // joint 11
    1.0,
    0.0,
    0.0,
    0.0,
    0.0,
    -0.0,
    -1.0,
    -0.0997,
    0.0,
    1.0,
    -0.0,
    -0.0,
    0.0,
    0.0,
    0.0,
    1.0,

    // joint 12
    1.0,
    -0.0,
    0.0,
    0.0,
    -0.0,
    -0.0,
    1.0,
    0.0996,
    -0.0,
    -1.0,
    -0.0,
    -0.0,
    0.0,
    0.0,
    0.0,
    1.0,

};

__device__ __constant__ int dual_ur5e_approx_sphere_to_joint[142] = {
    0,  1,  2,  2,  2,  2,  2,  2,  2,  3,  3,  3,  3,  3,  3,  3,  3,  4,
    5,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
    6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
    6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  0,
    7,  8,  8,  8,  8,  8,  8,  8,  9,  9,  9,  9,  9,  9,  9,  9,  10, 11,
    12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12,
    12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12,
    12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12};

__device__ __constant__ int dual_ur5e_approx_flattened_joint_to_spheres[155] = {
    0,   71,  -1,  1,   -1,  2,   3,   4,   5,   6,   7,   8,   -1,  9,   10,
    11,  12,  13,  14,  15,  16,  -1,  17,  -1,  18,  -1,  19,  20,  21,  22,
    23,  24,  25,  26,  27,  28,  29,  30,  31,  32,  33,  34,  35,  36,  37,
    38,  39,  40,  41,  42,  43,  44,  45,  46,  47,  48,  49,  50,  51,  52,
    53,  54,  55,  56,  57,  58,  59,  60,  61,  62,  63,  64,  65,  66,  67,
    68,  69,  70,  -1,  72,  -1,  73,  74,  75,  76,  77,  78,  79,  -1,  80,
    81,  82,  83,  84,  85,  86,  87,  -1,  88,  -1,  89,  -1,  90,  91,  92,
    93,  94,  95,  96,  97,  98,  99,  100, 101, 102, 103, 104, 105, 106, 107,
    108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122,
    123, 124, 125, 126, 127, 128, 129, 130, 131, 132, 133, 134, 135, 136, 137,
    138, 139, 140, 141, -1};

__device__ __constant__ int dual_ur5e_approx_joint_types[] = {
    3, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5};

__device__ __constant__ int dual_ur5e_approx_self_cc_ranges[86][3] = {
    {0, 72, 141},  {1, 9, 141},   {2, 17, 141},  {3, 17, 141},  {4, 17, 141},
    {5, 17, 141},  {6, 17, 141},  {7, 17, 141},  {8, 17, 141},  {9, 20, 141},
    {10, 20, 141}, {11, 20, 141}, {12, 20, 141}, {13, 20, 141}, {14, 20, 141},
    {15, 20, 141}, {16, 20, 141}, {17, 71, 141}, {18, 71, 141}, {19, 71, 141},
    {20, 71, 141}, {21, 71, 141}, {22, 71, 141}, {23, 71, 141}, {24, 71, 141},
    {25, 71, 141}, {26, 71, 141}, {27, 71, 141}, {28, 71, 141}, {29, 71, 141},
    {30, 71, 141}, {31, 71, 141}, {32, 71, 141}, {33, 71, 141}, {34, 71, 141},
    {35, 71, 141}, {36, 71, 141}, {37, 71, 141}, {38, 71, 141}, {39, 71, 141},
    {40, 71, 141}, {41, 71, 141}, {42, 71, 141}, {43, 71, 141}, {44, 71, 141},
    {45, 71, 141}, {46, 71, 141}, {47, 71, 141}, {48, 71, 141}, {49, 71, 141},
    {50, 71, 141}, {51, 71, 141}, {52, 71, 141}, {53, 71, 141}, {54, 71, 141},
    {55, 71, 141}, {56, 71, 141}, {57, 71, 141}, {58, 71, 141}, {59, 71, 141},
    {60, 71, 141}, {61, 71, 141}, {62, 71, 141}, {63, 71, 141}, {64, 71, 141},
    {65, 71, 141}, {66, 71, 141}, {67, 71, 141}, {68, 71, 141}, {69, 71, 141},
    {70, 71, 141}, {72, 80, 141}, {73, 88, 141}, {74, 88, 141}, {75, 88, 141},
    {76, 88, 141}, {77, 88, 141}, {78, 88, 141}, {79, 88, 141}, {80, 91, 141},
    {81, 91, 141}, {82, 91, 141}, {83, 91, 141}, {84, 91, 141}, {85, 91, 141},
    {86, 91, 141}};

__device__ __constant__ int dual_ur5e_approx_joint_parents[13] = {
    0, 0, 1, 2, 3, 4, 5, 0, 7, 8, 9, 10, 11};

__device__ __constant__ int dual_ur5e_approx_T_memory_idx[13] = {
    0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1};

__device__ __constant__ int dual_ur5e_approx_dfs_order[13] = {
    0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12};

template <>
__device__ void fk_approx<ppln::robots::Dual_UR5e>(
    const float *q,
    volatile float *sphere_pos_approx, // 142 spheres x 16 robots x 3
                                       // coordinates (each column is a robot)
    float *T, // 16 robots x 2 x 4x4 transform matrix , column major
    const int tid) {
  // every 4 threads are responsible for one column of the transform matrix T
  // make_transform will calculate the necessary column of T_step needed for the
  // thread
  const int col_ind = tid % 4;
  const int batch_ind = tid / 4;

  int T_offset = batch_ind * 3 * 16;
  float
      T_step_col[4]; // 4x1 column of the joint transform matrix for this thread
  float *T_base = T + T_offset; // 4x4 transform matrix for the batch

#pragma unroll
  for (int i = 0; i < 3; ++i) {
    float *T_col_i = T + i * 16 + col_ind * 4;
    for (int r = 0; r < 4; r++) {
      T_col_i[r] = 0.0f;
    }
    T_col_i[col_ind] = 1.0f;
  }

  int joint_to_sphere_ind = 0;

  // loop through each joint, accumulate transformation matrix, and update
  // sphere positions
  for (int j = 0; j < DUAL_UR5E_APPROX_JOINT_COUNT; ++j) {
    int i = dual_ur5e_approx_dfs_order[j];
    float T_col_tmp[4];
    int parent_idx = dual_ur5e_approx_joint_parents[i];
    int T_memory_idx_parent = dual_ur5e_approx_T_memory_idx[parent_idx];
    int T_memory_idx = dual_ur5e_approx_T_memory_idx[i];
    if (i > 0) {
      int ft_addr_start = i * 16;
      int joint_type = dual_ur5e_approx_joint_types[i];

      if (joint_type <= Z_PRISM) {
        prism_fn(&dual_ur5e_approx_fixed_transforms[ft_addr_start], q[i - 1],
                 col_ind, T_step_col, joint_type);
      } else if (joint_type == X_ROT) {
        xrot_fn(&dual_ur5e_approx_fixed_transforms[ft_addr_start], q[i - 1],
                col_ind, T_step_col);
      } else if (joint_type == Y_ROT) {
        yrot_fn(&dual_ur5e_approx_fixed_transforms[ft_addr_start], q[i - 1],
                col_ind, T_step_col);
      } else if (joint_type == Z_ROT) {
        zrot_fn(&dual_ur5e_approx_fixed_transforms[ft_addr_start], q[i - 1],
                col_ind, T_step_col);
      }

      for (int r = 0; r < 4; r++) {
        T_col_tmp[r] =
            dot4_col(&T_base[T_memory_idx_parent * 16 + r], T_step_col);
      }
      for (int r = 0; r < 4; r++) {
        T_base[T_memory_idx * 16 + col_ind * 4 + r] = T_col_tmp[r];
      }
    }
    __syncwarp();
    while (dual_ur5e_approx_flattened_joint_to_spheres[joint_to_sphere_ind] !=
           -1) {
      int sphere_ind =
          dual_ur5e_approx_flattened_joint_to_spheres[joint_to_sphere_ind];
      if (col_ind < 3) {
        // sphere sphere_ind, robot batch_ind (BATCH_SIZE robots), coord col_ind
        sphere_pos_approx[sphere_ind * BATCH_SIZE * 3 + batch_ind * 3 +
                          col_ind] =
            T_base[col_ind] * dual_ur5e_approx_spheres_array[sphere_ind].x +
            T_base[col_ind + M] * dual_ur5e_approx_spheres_array[sphere_ind].y +
            T_base[col_ind + M * 2] *
                dual_ur5e_approx_spheres_array[sphere_ind].z +
            T_base[col_ind + M * 3];
      }
      joint_to_sphere_ind++;
    }
    joint_to_sphere_ind++;
  }
}

// 4 threads per discretized motion for self-collision check
template <>
__device__ bool self_collision_check_approx<ppln::robots::Dual_UR5e>(
    volatile float *sphere_pos_approx, volatile int *joint_in_collision,
    const int tid) {
  const int thread_ind = tid % 4;
  const int batch_ind = tid / 4;

  for (int i = thread_ind; i < DUAL_UR5E_APPROX_SELF_CC_RANGE_COUNT; i += 4) {
    int sphere_1_ind = dual_ur5e_approx_self_cc_ranges[i][0];
    float sphere_1[3] = {
        sphere_pos_approx[sphere_1_ind * BATCH_SIZE * 3 + batch_ind * 3 + 0],
        sphere_pos_approx[sphere_1_ind * BATCH_SIZE * 3 + batch_ind * 3 + 1],
        sphere_pos_approx[sphere_1_ind * BATCH_SIZE * 3 + batch_ind * 3 + 2]};
    for (int j = dual_ur5e_approx_self_cc_ranges[i][1];
         j <= dual_ur5e_approx_self_cc_ranges[i][2]; j++) {
      float sphere_2[3] = {
          sphere_pos_approx[j * BATCH_SIZE * 3 + batch_ind * 3 + 0],
          sphere_pos_approx[j * BATCH_SIZE * 3 + batch_ind * 3 + 1],
          sphere_pos_approx[j * BATCH_SIZE * 3 + batch_ind * 3 + 2]};
      if (sphere_sphere_self_collision(
              sphere_1[0], sphere_1[1], sphere_1[2],
              dual_ur5e_approx_spheres_array[sphere_1_ind].w, sphere_2[0],
              sphere_2[1], sphere_2[2], dual_ur5e_approx_spheres_array[j].w)) {
        atomicAdd((int *)&joint_in_collision
                      [20 * batch_ind +
                       dual_ur5e_approx_sphere_to_joint[sphere_1_ind]],
                  1);
        return false;
      }
    }
  }
  return true;
}

// 4 threads per discretized motion for env collision check
template <>
__device__ bool env_collision_check_approx<ppln::robots::Dual_UR5e>(
    volatile float *sphere_pos_approx, volatile int *joint_in_collision,
    ppln::collision::Environment<float> *env, const int tid) {
  const int thread_ind = tid % 4;
  const int batch_ind = tid / 4;
  bool out = true;

#pragma unroll
  for (int i = DUAL_UR5E_APPROX_SPHERE_COUNT / 4 * thread_ind;
       i < DUAL_UR5E_APPROX_SPHERE_COUNT / 4 * (thread_ind + 1); i++) {
    // sphere i, robot batch_ind (16 robots)
    if (sphere_environment_in_collision(
            env, sphere_pos_approx[i * BATCH_SIZE * 3 + batch_ind * 3 + 0],
            sphere_pos_approx[i * BATCH_SIZE * 3 + batch_ind * 3 + 1],
            sphere_pos_approx[i * BATCH_SIZE * 3 + batch_ind * 3 + 2],
            dual_ur5e_approx_spheres_array[i].w)) {
      atomicAdd((int *)&joint_in_collision[20 * batch_ind +
                                           dual_ur5e_approx_sphere_to_joint[i]],
                1);
      out = false;
    }
  }

  int i = DUAL_UR5E_APPROX_SPHERE_COUNT - 1 - thread_ind;
  if (sphere_environment_in_collision(
          env, sphere_pos_approx[i * BATCH_SIZE * 3 + batch_ind * 3 + 0],
          sphere_pos_approx[i * BATCH_SIZE * 3 + batch_ind * 3 + 1],
          sphere_pos_approx[i * BATCH_SIZE * 3 + batch_ind * 3 + 2],
          dual_ur5e_approx_spheres_array[i].w)) {
    atomicAdd((int *)&joint_in_collision[20 * batch_ind +
                                         dual_ur5e_approx_sphere_to_joint[i]],
              1);
    out = false;
  }
  return out;
}

#define DUAL_UR5E_SPHERE_COUNT 142
#define DUAL_UR5E_JOINT_COUNT 13
#define DUAL_UR5E_SELF_CC_RANGE_COUNT 86
#define FIXED -1
#define X_PRISM 0
#define Y_PRISM 1
#define Z_PRISM 2
#define X_ROT 3
#define Y_ROT 4
#define Z_ROT 5
#define BATCH_SIZE 16

__device__ __constant__ float4 dual_ur5e_spheres_array[142] = {
    {-0.550003f, 1e-06f, 0.049546f, 0.090364f},
    {-3e-06f, -0.006649f, -0.001514f, 0.089842f},
    {-0.298805f, -2.2e-05f, 0.130656f, 0.094923f},
    {-0.422387f, -2.9e-05f, 0.129005f, 0.091263f},
    {-0.008711f, 6e-06f, 0.135378f, 0.090758f},
    {-0.370304f, -2.5e-05f, 0.131606f, 0.093838f},
    {-0.087952f, -3e-06f, 0.13542f, 0.092897f},
    {-0.221208f, -1.6e-05f, 0.132928f, 0.093117f},
    {-0.158663f, -1.2e-05f, 0.131799f, 0.089958f},
    {-0.375346f, -0.000304f, -0.011401f, 0.069786f},
    {-0.37299f, 0.000759f, 0.022953f, 0.073418f},
    {-0.295291f, -0.000411f, 0.009998f, 0.081417f},
    {-0.214257f, 0.000433f, 0.014403f, 0.085647f},
    {-0.123633f, 0.000247f, 0.012469f, 0.087811f},
    {-0.0451f, 0.001873f, 0.014119f, 0.086674f},
    {0.00852f, 0.010306f, 0.027016f, 0.066154f},
    {0.007854f, -0.011543f, 0.026729f, 0.070424f},
    {-0.000269f, -0.002284f, -0.013745f, 0.076148f},
    {-0.000228f, 0.000455f, -0.001258f, 0.069339f},
    {-0.000229f, -0.00018f, -0.022867f, 0.044717f},
    {-1e-06f, -1e-06f, 0.039762f, 0.053503f},
    {-0.0f, -0.032898f, 0.055274f, 0.011261f},
    {-0.0f, -0.047209f, 0.056403f, 0.013955f},
    {0.0f, -0.057371f, 0.056696f, 0.014264f},
    {0.005135f, -0.067632f, 0.093433f, 0.013081f},
    {-0.007378f, -0.067212f, 0.090199f, 0.014548f},
    {0.006824f, -0.064663f, 0.070548f, 0.01525f},
    {-0.007378f, -0.063899f, 0.064656f, 0.014756f},
    {0.000242f, -0.062279f, 0.052114f, 0.014265f},
    {-9e-06f, -0.065184f, 0.099282f, 0.01218f},
    {-8e-06f, -0.055765f, 0.104099f, 0.01124f},
    {-0.00049f, -0.05289f, 0.114141f, 0.010284f},
    {-8e-06f, -0.05181f, 0.106613f, 0.011778f},
    {0.000153f, -0.05284f, 0.125157f, 0.009281f},
    {-0.003606f, -0.052739f, 0.13621f, 0.008271f},
    {0.003611f, -0.052739f, 0.136261f, 0.008221f},
    {-0.0f, -0.049181f, 0.154075f, 0.015281f},
    {-0.0f, -0.049181f, 0.119074f, 0.015281f},
    {-0.000205f, -0.049181f, 0.142407f, 0.014664f},
    {0.000261f, -0.049181f, 0.129892f, 0.014593f},
    {-0.010146f, -0.016295f, 0.065629f, 0.01486f},
    {0.009674f, -0.015298f, 0.064462f, 0.014049f},
    {0.008911f, -0.028403f, 0.079806f, 0.015606f},
    {-0.011381f, -0.031605f, 0.083558f, 0.015752f},
    {0.009018f, -0.044138f, 0.098231f, 0.015341f},
    {-0.005911f, -0.046991f, 0.101571f, 0.01437f},
    {0.010146f, 0.016295f, 0.065629f, 0.01486f},
    {-0.009674f, 0.015298f, 0.064462f, 0.014049f},
    {-0.008911f, 0.028403f, 0.079806f, 0.015606f},
    {0.011381f, 0.031605f, 0.083558f, 0.015752f},
    {-0.009018f, 0.044138f, 0.098231f, 0.015341f},
    {0.005911f, 0.046991f, 0.101571f, 0.01437f},
    {-0.0f, 0.032898f, 0.055274f, 0.011261f},
    {-0.0f, 0.047209f, 0.056403f, 0.013955f},
    {-0.0f, 0.057371f, 0.056696f, 0.014264f},
    {-0.005135f, 0.067632f, 0.093433f, 0.013081f},
    {0.007378f, 0.067212f, 0.090199f, 0.014548f},
    {-0.006824f, 0.064663f, 0.070548f, 0.01525f},
    {0.007378f, 0.063899f, 0.064656f, 0.014756f},
    {-0.000242f, 0.062279f, 0.052114f, 0.014265f},
    {9e-06f, 0.065184f, 0.099282f, 0.01218f},
    {8e-06f, 0.055765f, 0.104099f, 0.01124f},
    {0.00049f, 0.05289f, 0.114141f, 0.010284f},
    {8e-06f, 0.05181f, 0.106613f, 0.011778f},
    {-0.000153f, 0.05284f, 0.125157f, 0.009281f},
    {0.003606f, 0.052739f, 0.13621f, 0.008271f},
    {-0.003611f, 0.052739f, 0.136261f, 0.008221f},
    {-0.0f, 0.049181f, 0.154075f, 0.015281f},
    {-0.0f, 0.049181f, 0.119074f, 0.015281f},
    {0.000205f, 0.049181f, 0.142407f, 0.014664f},
    {-0.000261f, 0.049181f, 0.129892f, 0.014593f},
    {0.549622f, 0.025881f, 0.049546f, 0.090364f},
    {-3e-06f, -0.006649f, -0.001514f, 0.089842f},
    {-0.298805f, -2.2e-05f, 0.130656f, 0.094923f},
    {-0.422387f, -2.9e-05f, 0.129005f, 0.091263f},
    {-0.008711f, 6e-06f, 0.135378f, 0.090758f},
    {-0.370304f, -2.5e-05f, 0.131606f, 0.093838f},
    {-0.087952f, -3e-06f, 0.13542f, 0.092897f},
    {-0.221208f, -1.6e-05f, 0.132928f, 0.093117f},
    {-0.158663f, -1.2e-05f, 0.131799f, 0.089958f},
    {-0.375346f, -0.000304f, -0.011401f, 0.069786f},
    {-0.37299f, 0.000759f, 0.022953f, 0.073418f},
    {-0.295291f, -0.000411f, 0.009998f, 0.081417f},
    {-0.214257f, 0.000433f, 0.014403f, 0.085647f},
    {-0.123633f, 0.000247f, 0.012469f, 0.087811f},
    {-0.0451f, 0.001873f, 0.014119f, 0.086674f},
    {0.00852f, 0.010306f, 0.027016f, 0.066154f},
    {0.007854f, -0.011543f, 0.026729f, 0.070424f},
    {-0.000269f, -0.002284f, -0.013745f, 0.076148f},
    {-0.000228f, 0.000455f, -0.001258f, 0.069339f},
    {-0.000229f, -0.00018f, -0.022867f, 0.044717f},
    {-1e-06f, -1e-06f, 0.039762f, 0.053503f},
    {-0.0f, -0.032898f, 0.055274f, 0.011261f},
    {-0.0f, -0.047209f, 0.056403f, 0.013955f},
    {0.0f, -0.057371f, 0.056696f, 0.014264f},
    {0.005135f, -0.067632f, 0.093433f, 0.013081f},
    {-0.007378f, -0.067212f, 0.090199f, 0.014548f},
    {0.006824f, -0.064663f, 0.070548f, 0.01525f},
    {-0.007378f, -0.063899f, 0.064656f, 0.014756f},
    {0.000242f, -0.062279f, 0.052114f, 0.014265f},
    {-9e-06f, -0.065184f, 0.099282f, 0.01218f},
    {-8e-06f, -0.055765f, 0.104099f, 0.01124f},
    {-0.00049f, -0.05289f, 0.114141f, 0.010284f},
    {-8e-06f, -0.05181f, 0.106613f, 0.011778f},
    {0.000153f, -0.05284f, 0.125157f, 0.009281f},
    {-0.003606f, -0.052739f, 0.13621f, 0.008271f},
    {0.003611f, -0.052739f, 0.136261f, 0.008221f},
    {-0.0f, -0.049181f, 0.154075f, 0.015281f},
    {-0.0f, -0.049181f, 0.119074f, 0.015281f},
    {-0.000205f, -0.049181f, 0.142407f, 0.014664f},
    {0.000261f, -0.049181f, 0.129892f, 0.014593f},
    {-0.010146f, -0.016295f, 0.065629f, 0.01486f},
    {0.009674f, -0.015298f, 0.064462f, 0.014049f},
    {0.008911f, -0.028403f, 0.079806f, 0.015606f},
    {-0.011381f, -0.031605f, 0.083558f, 0.015752f},
    {0.009018f, -0.044138f, 0.098231f, 0.015341f},
    {-0.005911f, -0.046991f, 0.101571f, 0.01437f},
    {0.010146f, 0.016295f, 0.065629f, 0.01486f},
    {-0.009674f, 0.015298f, 0.064462f, 0.014049f},
    {-0.008911f, 0.028403f, 0.079806f, 0.015606f},
    {0.011381f, 0.031605f, 0.083558f, 0.015752f},
    {-0.009018f, 0.044138f, 0.098231f, 0.015341f},
    {0.005911f, 0.046991f, 0.101571f, 0.01437f},
    {-0.0f, 0.032898f, 0.055274f, 0.011261f},
    {-0.0f, 0.047209f, 0.056403f, 0.013955f},
    {-0.0f, 0.057371f, 0.056696f, 0.014264f},
    {-0.005135f, 0.067632f, 0.093433f, 0.013081f},
    {0.007378f, 0.067212f, 0.090199f, 0.014548f},
    {-0.006824f, 0.064663f, 0.070548f, 0.01525f},
    {0.007378f, 0.063899f, 0.064656f, 0.014756f},
    {-0.000242f, 0.062279f, 0.052114f, 0.014265f},
    {9e-06f, 0.065184f, 0.099282f, 0.01218f},
    {8e-06f, 0.055765f, 0.104099f, 0.01124f},
    {0.00049f, 0.05289f, 0.114141f, 0.010284f},
    {8e-06f, 0.05181f, 0.106613f, 0.011778f},
    {-0.000153f, 0.05284f, 0.125157f, 0.009281f},
    {0.003606f, 0.052739f, 0.13621f, 0.008271f},
    {-0.003611f, 0.052739f, 0.136261f, 0.008221f},
    {-0.0f, 0.049181f, 0.154075f, 0.015281f},
    {-0.0f, 0.049181f, 0.119074f, 0.015281f},
    {0.000205f, 0.049181f, 0.142407f, 0.014664f},
    {-0.000261f, 0.049181f, 0.129892f, 0.014593f}};

__device__ __constant__ float dual_ur5e_fixed_transforms[] = {
    // joint 0
    1.0,
    0.0,
    0.0,
    0.0,
    0.0,
    1.0,
    0.0,
    0.0,
    0.0,
    0.0,
    1.0,
    0.0,
    0.0,
    0.0,
    0.0,
    1.0,

    // joint 1
    -1.0,
    -0.0,
    0.0,
    -0.55,
    0.0,
    -1.0,
    0.0,
    0.0,
    0.0,
    0.0,
    1.0,
    0.1625,
    0.0,
    0.0,
    0.0,
    1.0,

    // joint 2
    1.0,
    0.0,
    0.0,
    0.0,
    0.0,
    -0.0,
    -1.0,
    0.0,
    0.0,
    1.0,
    -0.0,
    0.0,
    0.0,
    0.0,
    0.0,
    1.0,

    // joint 3
    1.0,
    0.0,
    0.0,
    -0.425,
    0.0,
    1.0,
    0.0,
    0.0,
    0.0,
    0.0,
    1.0,
    0.0,
    0.0,
    0.0,
    0.0,
    1.0,

    // joint 4
    1.0,
    0.0,
    0.0,
    -0.3922,
    0.0,
    1.0,
    0.0,
    0.0,
    0.0,
    0.0,
    1.0,
    0.1333,
    0.0,
    0.0,
    0.0,
    1.0,

    // joint 5
    1.0,
    0.0,
    0.0,
    0.0,
    0.0,
    -0.0,
    -1.0,
    -0.0997,
    0.0,
    1.0,
    -0.0,
    -0.0,
    0.0,
    0.0,
    0.0,
    1.0,

    // joint 6
    1.0,
    -0.0,
    0.0,
    0.0,
    -0.0,
    -0.0,
    1.0,
    0.0996,
    -0.0,
    -1.0,
    -0.0,
    -0.0,
    0.0,
    0.0,
    0.0,
    1.0,

    // joint 7
    0.999343,
    -0.036239,
    0.0,
    0.549619,
    0.036239,
    0.999343,
    0.0,
    0.025882,
    0.0,
    0.0,
    1.0,
    0.1625,
    0.0,
    0.0,
    0.0,
    1.0,

    // joint 8
    1.0,
    0.0,
    0.0,
    0.0,
    0.0,
    -0.0,
    -1.0,
    0.0,
    0.0,
    1.0,
    -0.0,
    0.0,
    0.0,
    0.0,
    0.0,
    1.0,

    // joint 9
    1.0,
    0.0,
    0.0,
    -0.425,
    0.0,
    1.0,
    0.0,
    0.0,
    0.0,
    0.0,
    1.0,
    0.0,
    0.0,
    0.0,
    0.0,
    1.0,

    // joint 10
    1.0,
    0.0,
    0.0,
    -0.3922,
    0.0,
    1.0,
    0.0,
    0.0,
    0.0,
    0.0,
    1.0,
    0.1333,
    0.0,
    0.0,
    0.0,
    1.0,

    // joint 11
    1.0,
    0.0,
    0.0,
    0.0,
    0.0,
    -0.0,
    -1.0,
    -0.0997,
    0.0,
    1.0,
    -0.0,
    -0.0,
    0.0,
    0.0,
    0.0,
    1.0,

    // joint 12
    1.0,
    -0.0,
    0.0,
    0.0,
    -0.0,
    -0.0,
    1.0,
    0.0996,
    -0.0,
    -1.0,
    -0.0,
    -0.0,
    0.0,
    0.0,
    0.0,
    1.0,

};

__device__ __constant__ int dual_ur5e_sphere_to_joint[142] = {
    0,  1,  2,  2,  2,  2,  2,  2,  2,  3,  3,  3,  3,  3,  3,  3,  3,  4,
    5,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
    6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
    6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  0,
    7,  8,  8,  8,  8,  8,  8,  8,  9,  9,  9,  9,  9,  9,  9,  9,  10, 11,
    12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12,
    12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12,
    12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12};

__device__ __constant__ int dual_ur5e_flattened_joint_to_spheres[155] = {
    0,   71,  -1,  1,   -1,  2,   3,   4,   5,   6,   7,   8,   -1,  9,   10,
    11,  12,  13,  14,  15,  16,  -1,  17,  -1,  18,  -1,  19,  20,  21,  22,
    23,  24,  25,  26,  27,  28,  29,  30,  31,  32,  33,  34,  35,  36,  37,
    38,  39,  40,  41,  42,  43,  44,  45,  46,  47,  48,  49,  50,  51,  52,
    53,  54,  55,  56,  57,  58,  59,  60,  61,  62,  63,  64,  65,  66,  67,
    68,  69,  70,  -1,  72,  -1,  73,  74,  75,  76,  77,  78,  79,  -1,  80,
    81,  82,  83,  84,  85,  86,  87,  -1,  88,  -1,  89,  -1,  90,  91,  92,
    93,  94,  95,  96,  97,  98,  99,  100, 101, 102, 103, 104, 105, 106, 107,
    108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122,
    123, 124, 125, 126, 127, 128, 129, 130, 131, 132, 133, 134, 135, 136, 137,
    138, 139, 140, 141, -1};

__device__ __constant__ int dual_ur5e_joint_types[] = {3, 5, 5, 5, 5, 5, 5,
                                                       5, 5, 5, 5, 5, 5};

__device__ __constant__ int dual_ur5e_self_cc_ranges[86][3] = {
    {0, 72, 141},  {1, 9, 141},   {2, 17, 141},  {3, 17, 141},  {4, 17, 141},
    {5, 17, 141},  {6, 17, 141},  {7, 17, 141},  {8, 17, 141},  {9, 20, 141},
    {10, 20, 141}, {11, 20, 141}, {12, 20, 141}, {13, 20, 141}, {14, 20, 141},
    {15, 20, 141}, {16, 20, 141}, {17, 71, 141}, {18, 71, 141}, {19, 71, 141},
    {20, 71, 141}, {21, 71, 141}, {22, 71, 141}, {23, 71, 141}, {24, 71, 141},
    {25, 71, 141}, {26, 71, 141}, {27, 71, 141}, {28, 71, 141}, {29, 71, 141},
    {30, 71, 141}, {31, 71, 141}, {32, 71, 141}, {33, 71, 141}, {34, 71, 141},
    {35, 71, 141}, {36, 71, 141}, {37, 71, 141}, {38, 71, 141}, {39, 71, 141},
    {40, 71, 141}, {41, 71, 141}, {42, 71, 141}, {43, 71, 141}, {44, 71, 141},
    {45, 71, 141}, {46, 71, 141}, {47, 71, 141}, {48, 71, 141}, {49, 71, 141},
    {50, 71, 141}, {51, 71, 141}, {52, 71, 141}, {53, 71, 141}, {54, 71, 141},
    {55, 71, 141}, {56, 71, 141}, {57, 71, 141}, {58, 71, 141}, {59, 71, 141},
    {60, 71, 141}, {61, 71, 141}, {62, 71, 141}, {63, 71, 141}, {64, 71, 141},
    {65, 71, 141}, {66, 71, 141}, {67, 71, 141}, {68, 71, 141}, {69, 71, 141},
    {70, 71, 141}, {72, 80, 141}, {73, 88, 141}, {74, 88, 141}, {75, 88, 141},
    {76, 88, 141}, {77, 88, 141}, {78, 88, 141}, {79, 88, 141}, {80, 91, 141},
    {81, 91, 141}, {82, 91, 141}, {83, 91, 141}, {84, 91, 141}, {85, 91, 141},
    {86, 91, 141}};

__device__ __constant__ int dual_ur5e_joint_parents[13] = {0, 0, 1, 2, 3,  4, 5,
                                                           0, 7, 8, 9, 10, 11};

__device__ __constant__ int dual_ur5e_T_memory_idx[13] = {0, 1, 1, 1, 1, 1, 1,
                                                          1, 1, 1, 1, 1, 1};

__device__ __constant__ int dual_ur5e_dfs_order[13] = {0, 1, 2, 3,  4,  5, 6,
                                                       7, 8, 9, 10, 11, 12};

template <>
__device__ void fk<ppln::robots::Dual_UR5e>(
    const float *q,
    volatile float *sphere_pos, // 142 spheres x 16 robots x 3 coordinates
    float *T,                   // 16 robots x 2 x 4x4 transform matrix
    const int tid) {
  // every 4 threads are responsible for one column of the transform matrix T
  // make_transform will calculate the necessary column of T_step needed for the
  // thread
  const int col_ind = tid % 4;
  const int batch_ind = tid / 4;

  int T_offset = batch_ind * 3 * 16;
  float
      T_step_col[4]; // 4x1 column of the joint transform matrix for this thread
  float *T_base = T + T_offset; // 4x4 transform matrix for the batch

#pragma unroll
  for (int i = 0; i < 3; ++i) {
    float *T_col_i = T + i * 16 + col_ind * 4;
    for (int r = 0; r < 4; r++) {
      T_col_i[r] = 0.0f;
    }
    T_col_i[col_ind] = 1.0f;
  }

  int joint_to_sphere_ind = 0;

  // loop through each joint, accumulate transformation matrix, and update
  // sphere positions
  for (int j = 0; j < DUAL_UR5E_JOINT_COUNT; ++j) {
    int i = dual_ur5e_dfs_order[j];
    float T_col_tmp[4];
    int parent_idx = dual_ur5e_joint_parents[i];
    int T_memory_idx_parent = dual_ur5e_T_memory_idx[parent_idx];
    int T_memory_idx = dual_ur5e_T_memory_idx[i];
    if (i > 0) {
      int ft_addr_start = i * 16;
      int joint_type = dual_ur5e_joint_types[i];
      if (joint_type <= Z_PRISM) {
        prism_fn(&dual_ur5e_fixed_transforms[ft_addr_start], q[i - 1], col_ind,
                 T_step_col, joint_type);
      } else if (joint_type == X_ROT) {
        xrot_fn(&dual_ur5e_fixed_transforms[ft_addr_start], q[i - 1], col_ind,
                T_step_col);
      } else if (joint_type == Y_ROT) {
        yrot_fn(&dual_ur5e_fixed_transforms[ft_addr_start], q[i - 1], col_ind,
                T_step_col);
      } else if (joint_type == Z_ROT) {
        zrot_fn(&dual_ur5e_fixed_transforms[ft_addr_start], q[i - 1], col_ind,
                T_step_col);
      }
      for (int r = 0; r < 4; r++) {
        T_col_tmp[r] =
            dot4_col(&T_base[T_memory_idx_parent * 16 + r], T_step_col);
      }
      for (int r = 0; r < 4; r++) {
        T_base[T_memory_idx * 16 + col_ind * 4 + r] = T_col_tmp[r];
      }
    }
    __syncwarp();

    while (dual_ur5e_flattened_joint_to_spheres[joint_to_sphere_ind] != -1) {
      int sphere_ind =
          dual_ur5e_flattened_joint_to_spheres[joint_to_sphere_ind];
      if (col_ind < 3) {
        // sphere sphere_ind, robot batch_ind (16 robots), coord col_ind
        sphere_pos[sphere_ind * BATCH_SIZE * 3 + batch_ind * 3 + col_ind] =
            T_base[col_ind] * dual_ur5e_spheres_array[sphere_ind].x +
            T_base[col_ind + M] * dual_ur5e_spheres_array[sphere_ind].y +
            T_base[col_ind + M * 2] * dual_ur5e_spheres_array[sphere_ind].z +
            T_base[col_ind + M * 3];
      }
      joint_to_sphere_ind++;
    }
    joint_to_sphere_ind++;
  }
}

// 4 threads per discretized motion for self-collision check
template <>
__device__ bool
self_collision_check<ppln::robots::Dual_UR5e>(volatile float *sphere_pos,
                                              volatile int *joint_in_collision,
                                              const int tid) {
  const int thread_ind = tid % 4;
  const int batch_ind = tid / 4;
  bool has_collision = false;

  for (int i = thread_ind; i < DUAL_UR5E_SELF_CC_RANGE_COUNT; i += 4) {
    if (warp_any_active_mask(has_collision))
      return false;
    int sphere_1_ind = dual_ur5e_self_cc_ranges[i][0];
    if (joint_in_collision[20 * batch_ind +
                           dual_ur5e_sphere_to_joint[sphere_1_ind]] == 0)
      continue;
    float sphere_1[3] = {
        sphere_pos[sphere_1_ind * BATCH_SIZE * 3 + batch_ind * 3 + 0],
        sphere_pos[sphere_1_ind * BATCH_SIZE * 3 + batch_ind * 3 + 1],
        sphere_pos[sphere_1_ind * BATCH_SIZE * 3 + batch_ind * 3 + 2]};
    for (int j = dual_ur5e_self_cc_ranges[i][1];
         j <= dual_ur5e_self_cc_ranges[i][2]; j++) {
      float sphere_2[3] = {sphere_pos[j * BATCH_SIZE * 3 + batch_ind * 3 + 0],
                           sphere_pos[j * BATCH_SIZE * 3 + batch_ind * 3 + 1],
                           sphere_pos[j * BATCH_SIZE * 3 + batch_ind * 3 + 2]};
      if (sphere_sphere_self_collision(sphere_1[0], sphere_1[1], sphere_1[2],
                                       dual_ur5e_spheres_array[sphere_1_ind].w,
                                       sphere_2[0], sphere_2[1], sphere_2[2],
                                       dual_ur5e_spheres_array[j].w)) {
        // return false;
        has_collision = true;
      }
    }
  }
  return !has_collision;
}

// 4 threads per discretized motion for env collision check
template <>
__device__ bool env_collision_check<ppln::robots::Dual_UR5e>(
    volatile float *sphere_pos, volatile int *joint_in_collision,
    ppln::collision::Environment<float> *env, const int tid) {
  const int thread_ind = tid % 4;
  const int batch_ind = tid / 4;
  bool has_collision = false;

  for (int i = DUAL_UR5E_SPHERE_COUNT - 1 - thread_ind;
       i >= DUAL_UR5E_SPHERE_COUNT % 4; i -= 4) {
    // sphere i, robot batch_ind (16 robots)
    if (joint_in_collision[20 * batch_ind + dual_ur5e_sphere_to_joint[i]] > 0 &&
        sphere_environment_in_collision(
            env, sphere_pos[i * BATCH_SIZE * 3 + batch_ind * 3 + 0],
            sphere_pos[i * BATCH_SIZE * 3 + batch_ind * 3 + 1],
            sphere_pos[i * BATCH_SIZE * 3 + batch_ind * 3 + 2],
            dual_ur5e_spheres_array[i].w)) {
      has_collision = true;
      // return false;
    }
    if (warp_any_full_mask(has_collision))
      return false;
  }

  int i = thread_ind;
  if (joint_in_collision[20 * batch_ind + dual_ur5e_sphere_to_joint[i]] > 0 &&
      sphere_environment_in_collision(
          env, sphere_pos[i * BATCH_SIZE * 3 + batch_ind * 3 + 0],
          sphere_pos[i * BATCH_SIZE * 3 + batch_ind * 3 + 1],
          sphere_pos[i * BATCH_SIZE * 3 + batch_ind * 3 + 2],
          dual_ur5e_spheres_array[i].w)) {
    has_collision = true;
    // return false;
  }

  return !has_collision;
}
} // namespace ppln::collision
