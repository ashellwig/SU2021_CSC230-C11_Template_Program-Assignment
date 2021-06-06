
const double GALLONS_IN_A_CUBIC_FEET = 7.48;

class swimmingPool {
public:
  void set(double l = 0, double w = 0, double d = 0, double fi = 0,
           double fo = 0, double wInPool = 0);

  void setLength(double l);
  void setWidth(double w);
  void setDepth(double d);
  void setWaterFlowRateIn(double fi);
  void setWaterFlowRateOut(double fo);

  void addWater(double time, double fillRate);
  void drainWater(double time, double drainRate);

  double poolTotalWaterCapacity();

  double getLength();
  double getWidth();
  double getDepth();
  double getWaterFlowRateIn();
  double getWaterFlowRateOut();
  double getTotalWaterInPool();

  int timeToFillThePool();
  int timeToDrainThePool();

  double waterNeededToFillThePool();

  swimmingPool(double l = 0, double w = 0, double d = 0, double fi = 0,
               double fo = 0, double wInPool = 0);
  // Constructor

private:
  double length;
  double width;
  double depth;
  double waterFlowInRate;
  double waterFlowOutRate;
  double amountOfWaterInPool;
};
