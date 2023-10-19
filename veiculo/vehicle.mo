model vehicle
  Real ang(start = 10);
  Real acc(start = 1);
  Modelica.Blocks.Continuous.Integrator velocity annotation(
    Placement(transformation(origin = {40, 0}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.RealExpression realExpression(y = acc) annotation(
    Placement(transformation(origin = {6, 0}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.RealExpression realExpression1(y = ang) annotation(
    Placement(transformation(origin = {-142, 38}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Cos cos annotation(
    Placement(transformation(origin = {38, 38}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Continuous.Integrator pos_x annotation(
    Placement(transformation(origin = {104, 20}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Continuous.Integrator direction annotation(
    Placement(transformation(origin = {-28, 38}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.MultiProduct multiProduct(nu = 2) annotation(
    Placement(transformation(origin = {70, 20}, extent = {{-6, -6}, {6, 6}})));
  Modelica.Blocks.Math.Sin sin annotation(
    Placement(transformation(origin = {40, -38}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.MultiProduct multiProduct1(nu = 2) annotation(
    Placement(transformation(origin = {70, -20}, extent = {{-6, -6}, {6, 6}})));
  Modelica.Blocks.Continuous.Integrator pos_y annotation(
    Placement(transformation(origin = {104, -20}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.UnitConversions.From_deg from_deg annotation(
    Placement(visible = true, transformation(origin = {-86, 38}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
equation
  connect(realExpression.y, velocity.u) annotation(
    Line(points = {{17, 0}, {28, 0}}, color = {0, 0, 127}));
  connect(direction.y, cos.u) annotation(
    Line(points = {{-17, 38}, {26, 38}}, color = {0, 0, 127}));
  connect(cos.y, multiProduct.u[1]) annotation(
    Line(points = {{49, 38}, {63, 38}, {63, 20}}, color = {0, 0, 127}));
  connect(velocity.y, multiProduct.u[2]) annotation(
    Line(points = {{51, 0}, {65, 0}, {65, 20}, {64, 20}}, color = {0, 0, 127}));
  connect(multiProduct.y, pos_x.u) annotation(
    Line(points = {{77.02, 20}, {92.02, 20}}, color = {0, 0, 127}));
  connect(direction.y, sin.u) annotation(
    Line(points = {{-17, 38}, {-13, 38}, {-13, -38}, {27, -38}}, color = {0, 0, 127}));
  connect(sin.y, multiProduct1.u[1]) annotation(
    Line(points = {{51, -38}, {63, -38}, {63, -20}}, color = {0, 0, 127}));
  connect(velocity.y, multiProduct1.u[2]) annotation(
    Line(points = {{51, 0}, {65, 0}, {65, -20}, {64, -20}}, color = {0, 0, 127}));
  connect(multiProduct1.y, pos_y.u) annotation(
    Line(points = {{77.02, -20}, {91.02, -20}}, color = {0, 0, 127}));
  connect(realExpression1.y, from_deg.u) annotation(
    Line(points = {{-130, 38}, {-105, 38}}, color = {0, 0, 127}));
  connect(from_deg.y, direction.u) annotation(
    Line(points = {{-68, 38}, {-40, 38}}, color = {0, 0, 127}));
algorithm
  if time >= 50 then
    ang := 30;
    acc := -0.5;
  end if;
  annotation(
    uses(Modelica(version = "4.0.0")),
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}})),
    Icon(coordinateSystem(extent = {{-200, -200}, {200, 200}})),
    version = "",
  experiment(StartTime = 0, StopTime = 100, Tolerance = 1e-6, Interval = 0.2));
end vehicle;