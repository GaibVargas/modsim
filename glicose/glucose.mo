model glucose
  Real k1 = 0.02;
  Real kp = 6;
  Real km(start = 20);
  Real vin(start = 0.36);
  
  Modelica.Blocks.Continuous.Integrator integrator(initType = Modelica.Blocks.Types.Init.InitialOutput, y(fixed = true), y_start = 5)  annotation(
    Placement(visible = true, transformation(origin = {68, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator integrator1(initType = Modelica.Blocks.Types.Init.InitialOutput, y(fixed = true), y_start = 5)  annotation(
    Placement(visible = true, transformation(origin = {68, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  Real ATP = integrator.y;
  Real G = integrator1.y;
  
  Modelica.Blocks.Sources.RealExpression realExpression(y = 2*k1*G*ATP - (kp* ATP)/(ATP + km))  annotation(
    Placement(visible = true, transformation(origin = {-29, 70}, extent = {{-61, -10}, {61, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression1(y = vin - k1*G*ATP)  annotation(
    Placement(visible = true, transformation(origin = {-1, 38}, extent = {{-31, -8}, {31, 8}}, rotation = 0)));
  inner Modelica.StateGraph.StateGraphRoot stateGraphRoot annotation(
    Placement(visible = true, transformation(origin = {-70, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.InitialStepWithSignal initialStepWithSignal(nOut = 1)  annotation(
    Placement(visible = true, transformation(origin = {-130, -28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.StepWithSignal stepWithSignal(nIn = 1, nOut = 1)  annotation(
    Placement(visible = true, transformation(origin = {-10, -28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  final Modelica.StateGraph.Step step(nIn = 1)  annotation(
    Placement(visible = true, transformation(origin = {122, -28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.TransitionWithSignal transitionWithSignal annotation(
    Placement(visible = true, transformation(origin = {-58, -28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.TransitionWithSignal transitionWithSignal1 annotation(
    Placement(visible = true, transformation(origin = {70, -28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.GreaterThreshold greaterThreshold1(threshold = 250) annotation(
    Placement(visible = true, transformation(origin = {-80, -62}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.Timer timer1 annotation(
    Placement(visible = true, transformation(origin = {-112, -62}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.Timer timer annotation(
    Placement(visible = true, transformation(origin = {12, -62}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.GreaterThreshold greaterThreshold(threshold = 250) annotation(
    Placement(visible = true, transformation(origin = {46, -62}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  when initialStepWithSignal.active then
    km = 20;
    vin = 0.36;
  elsewhen stepWithSignal.active then
    km = 20;
    vin = 0.62;
  elsewhen step.active then
    km = 13;
    vin = 0.62;
  end when;

  connect(realExpression.y, integrator.u) annotation(
    Line(points = {{38.1, 70}, {56, 70}}, color = {0, 0, 127}));
  connect(realExpression1.y, integrator1.u) annotation(
    Line(points = {{33.1, 38}, {56, 38}}, color = {0, 0, 127}));
  connect(timer1.y, greaterThreshold1.u) annotation(
    Line(points = {{-101, -62}, {-92, -62}}, color = {0, 0, 127}));
  connect(initialStepWithSignal.active, timer1.u) annotation(
    Line(points = {{-130, -38}, {-130, -62}, {-124, -62}}, color = {255, 0, 255}));
  connect(greaterThreshold1.y, transitionWithSignal.condition) annotation(
    Line(points = {{-68, -62}, {-58, -62}, {-58, -40}}, color = {255, 0, 255}));
  connect(initialStepWithSignal.outPort[1], transitionWithSignal.inPort) annotation(
    Line(points = {{-120, -28}, {-62, -28}}));
  connect(transitionWithSignal.outPort, stepWithSignal.inPort[1]) annotation(
    Line(points = {{-56, -28}, {-21, -28}}));
  connect(stepWithSignal.outPort[1], transitionWithSignal1.inPort) annotation(
    Line(points = {{0.5, -28}, {66, -28}}));
  connect(transitionWithSignal1.outPort, step.inPort[1]) annotation(
    Line(points = {{71.5, -28}, {111, -28}}));
  connect(timer.y, greaterThreshold.u) annotation(
    Line(points = {{23, -62}, {34, -62}}, color = {0, 0, 127}));
  connect(stepWithSignal.active, timer.u) annotation(
    Line(points = {{-10, -38}, {-8, -38}, {-8, -62}, {0, -62}}, color = {255, 0, 255}));
  connect(transitionWithSignal1.condition, greaterThreshold.y) annotation(
    Line(points = {{70, -40}, {70, -62}, {57, -62}}, color = {255, 0, 255}));
  annotation(
    uses(Modelica(version = "4.0.0")),
  Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}})),
  Icon(coordinateSystem(extent = {{-200, -200}, {200, 200}})),
  version = "");
end glucose;