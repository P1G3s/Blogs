### Opts

#### 机器无关优化(Machine Indep. Opts)
- 提高循环效率
- 减少函数调用
- 减少不必要内存应用

#### 机器相关优化(Machine dep. Opts)
- 循环展开 : 通过减少循环的次数，来减少与计算结果无关的操作
- 多个累计变量 : 把计算分成多个部分，从而减少数据相关，提高并行性 
- 重新结合变换 : 通过利用加法乘法结合律和转换率，改变运算顺序，从而减少数据相关，提高并行性

#### Caution
**程序至少需要T个周期才能执行完。 T=数据线关联所有的延迟之和**
**条件传送不需要猜测条件是否满足，所以尽量使用条件传送**



