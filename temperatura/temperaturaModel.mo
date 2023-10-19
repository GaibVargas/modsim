model temperaturaModel
  Real a = 0.1;
  Real Tr = 2;
  Real Ta = 2;
  Real mu(start = 1);
  Modelica.Blocks.Continuous.Integrator integrator annotation(
    Placement(visible = true, transformation(origin = {73, 53}, extent = {{-17, -17}, {17, 17}}, rotation = 0)));
  Real T = integrator.y;
  Modelica.Blocks.Sources.RealExpression realExpression1(y = -a*T + Tr+ mu*Ta) annotation(
    Placement(visible = true, transformation(origin = {-42, 53}, extent = {{-44, -11}, {44, 11}}, rotation = 0)));
  Modelica.StateGraph.Step desligado(nIn = 1, nOut = 1) annotation(
    Placement(visible = true, transformation(origin = {34, -76}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.TransitionWithSignal transitionWithSignal annotation(
    Placement(visible = true, transformation(origin = {0, -76}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.TransitionWithSignal transitionWithSignal1 annotation(
    Placement(visible = true, transformation(origin = {0, -22}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression(y = T < 25) annotation(
    Placement(visible = true, transformation(origin = {-30, -40}, extent = {{-18, -10}, {18, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression1(y = T > 35) annotation(
    Placement(visible = true, transformation(origin = {-28, -101}, extent = {{-18, -9}, {18, 9}}, rotation = 0)));
  inner Modelica.StateGraph.StateGraphRoot stateGraphRoot annotation(
    Placement(visible = true, transformation(origin = {94, -24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.InitialStep ligado(nOut = 1, nIn = 1)  annotation(
    Placement(visible = true, transformation(origin = {-56, -76}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  when ligado.active then
    mu = 1;
   elsewhen desligado.active then
    mu = 0;
   end when;

  connect(transitionWithSignal.outPort, desligado.inPort[1]) annotation(
    Line(points = {{1.5, -76}, {23.5, -76}}));
  connect(desligado.outPort[1], transitionWithSignal1.inPort) annotation(
    Line(points = {{44.5, -76}, {50.5, -76}, {50.5, -22}, {4.5, -22}}));
  connect(booleanExpression.y, transitionWithSignal1.condition) annotation(
    Line(points = {{-10, -40}, {0, -40}, {0, -34}}, color = {255, 0, 255}));
  connect(booleanExpression1.y, transitionWithSignal.condition) annotation(
    Line(points = {{-8, -101}, {0, -101}, {0, -88}}, color = {255, 0, 255}));
  connect(realExpression1.y, integrator.u) annotation(
    Line(points = {{6, 53}, {52.5, 53}, {52.5, 54}, {52, 54}}, color = {0, 0, 127}));
  connect(ligado.outPort[1], transitionWithSignal.inPort) annotation(
    Line(points = {{-45.5, -76}, {-4, -76}}));
  connect(transitionWithSignal1.outPort, ligado.inPort[1]) annotation(
    Line(points = {{-2, -22}, {-76, -22}, {-76, -76}, {-67, -76}}));
  annotation(
    uses(Modelica(version = "4.0.0")),
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}})),
    Icon(coordinateSystem(extent = {{-200, -200}, {200, 200}})),
    version = "",
    experiment(StartTime = 0, StopTime = 100, Tolerance = 1e-06, Interval = 0.2));
end temperaturaModel;