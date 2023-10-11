model glucose
  Real k1 = 0.02;
  Real kp = 6;
  Real km = 20;
  Real vin = 0.36;
  
  Modelica.Blocks.Continuous.Integrator integrator(initType = Modelica.Blocks.Types.Init.InitialOutput, y(fixed = true), y_start = 5)  annotation(
    Placement(visible = true, transformation(origin = {60, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator integrator1(initType = Modelica.Blocks.Types.Init.InitialOutput, y(fixed = true), y_start = 5)  annotation(
    Placement(visible = true, transformation(origin = {62, -18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  Real ATP = integrator.y;
  Real G = integrator1.y;
  
  Modelica.Blocks.Sources.RealExpression realExpression(y = 2*k1*G*ATP - (kp* ATP)/(ATP + km))  annotation(
    Placement(visible = true, transformation(origin = {-37, 28}, extent = {{-61, -10}, {61, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression1(y = vin - k1*G*ATP)  annotation(
    Placement(visible = true, transformation(origin = {-7, -18}, extent = {{-31, -8}, {31, 8}}, rotation = 0)));
equation
  connect(realExpression.y, integrator.u) annotation(
    Line(points = {{30.1, 28}, {48, 28}}, color = {0, 0, 127}));
  connect(realExpression1.y, integrator1.u) annotation(
    Line(points = {{27.1, -18}, {50, -18}}, color = {0, 0, 127}));

annotation(
    uses(Modelica(version = "4.0.0")));
end glucose;