model temperaturaModel
  Real a = 0.1;
  Real Tr = 2;
  Real Ta = 2;
  Real mu(start = 1);
  Modelica.Blocks.Continuous.Integrator integrator annotation(
    Placement(transformation(origin = {35, -3}, extent = {{-17, -17}, {17, 17}})));
  Real T = integrator.y;
  Modelica.Blocks.Sources.RealExpression realExpression1(y = -a*T +Tr + mu*Ta) annotation(
    Placement(transformation(origin = {-50, -2}, extent = {{-34, -34}, {34, 34}})));
equation
  connect(realExpression1.y, integrator.u) annotation(
    Line(points = {{-13, -2}, {11.5, -2}, {11.5, -3}, {15, -3}}, color = {0, 0, 127}));
  annotation(
    uses(Modelica(version = "4.0.0")),
    Diagram);
algorithm
  if time >= 50 then
    mu := 0;
  end if;
end temperaturaModel;