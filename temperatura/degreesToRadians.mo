model degreesToRadians
  Real pi = 3.1415926535;
  Modelica.Blocks.Math.MultiProduct multiProduct(nu = 2)  annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput u annotation(
    Placement(visible = true, transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-86, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y annotation(
    Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression(y = pi/180)  annotation(
    Placement(transformation(origin = {-59, 23}, extent = {{-17, -17}, {17, 17}})));
equation
  connect(u, multiProduct.u[1]) annotation(
    Line(points = {{-120, 0}, {-6, 0}}, color = {0, 0, 127}));
  connect(multiProduct.y, y) annotation(
    Line(points = {{8, 0}, {110, 0}}, color = {0, 0, 127}));
  connect(realExpression.y, multiProduct.u[2]) annotation(
    Line(points = {{-40, 23}, {-7, 23}, {-7, 0}, {-6, 0}}, color = {0, 0, 127}));

annotation(
    uses(Modelica(version = "4.0.0")));
end degreesToRadians;