model vehicle
  Real ang(start = 0);
  Real acc(start = 0);
  Modelica.Blocks.Continuous.Integrator velocity annotation(
    Placement(visible = true, transformation(origin = {64, 102}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression(y = acc) annotation(
    Placement(visible = true, transformation(origin = {30, 102}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression1(y = ang) annotation(
    Placement(visible = true, transformation(origin = {-118, 140}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Cos cos annotation(
    Placement(visible = true, transformation(origin = {62, 140}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator pos_x annotation(
    Placement(visible = true, transformation(origin = {128, 122}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator direction annotation(
    Placement(visible = true, transformation(origin = {-4, 140}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.MultiProduct multiProduct(nu = 2) annotation(
    Placement(visible = true, transformation(origin = {94, 122}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Sin sin annotation(
    Placement(visible = true, transformation(origin = {64, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.MultiProduct multiProduct1(nu = 2) annotation(
    Placement(visible = true, transformation(origin = {94, 82}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator pos_y annotation(
    Placement(visible = true, transformation(origin = {128, 82}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.UnitConversions.From_deg from_deg annotation(
    Placement(visible = true, transformation(origin = {-62, 140}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
  Modelica.StateGraph.Step step(nIn = 1, nOut = 1)  annotation(
    Placement(visible = true, transformation(origin = {-148, -28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.Step step2(nIn = 1, nOut = 1)  annotation(
    Placement(visible = true, transformation(origin = {196, -28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.TransitionWithSignal transitionWithSignal annotation(
    Placement(visible = true, transformation(origin = {-188, -28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.Timer timer annotation(
    Placement(visible = true, transformation(origin = {-242, -54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.InitialStepWithSignal initialStepWithSignal(nOut = 1)  annotation(
    Placement(visible = true, transformation(origin = {-260, -28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.GreaterThreshold greaterThreshold(threshold = 1)  annotation(
    Placement(visible = true, transformation(origin = {-210, -54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.TransitionWithSignal transitionWithSignal1 annotation(
    Placement(visible = true, transformation(origin = {-120, -28}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression(y = velocity.y > 16.5)  annotation(
    Placement(visible = true, transformation(origin = {-195, 4}, extent = {{-47, -8}, {47, 8}}, rotation = 0)));
  Modelica.StateGraph.StepWithSignal stepWithSignal(nIn = 1, nOut = 1)  annotation(
    Placement(visible = true, transformation(origin = {-90, -28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.Timer timer1 annotation(
    Placement(visible = true, transformation(origin = {-60, -54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.GreaterThreshold greaterThreshold1(threshold = 5) annotation(
    Placement(visible = true, transformation(origin = {-28, -54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.TransitionWithSignal transitionWithSignal2 annotation(
    Placement(visible = true, transformation(origin = {-6, -28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.StepWithSignal stepWithSignal1(nIn = 1, nOut = 1) annotation(
    Placement(visible = true, transformation(origin = {34, -28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.TransitionWithSignal transitionWithSignal3 annotation(
    Placement(visible = true, transformation(origin = {106, -28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.Timer timer2 annotation(
    Placement(visible = true, transformation(origin = {52, -54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.GreaterThreshold greaterThreshold2(threshold = 5) annotation(
    Placement(visible = true, transformation(origin = {84, -54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression1(y = velocity.y > 33) annotation(
    Placement(visible = true, transformation(origin = {106, 4}, extent = {{-36, -10}, {36, 10}}, rotation = 0)));
  Modelica.StateGraph.TransitionWithSignal transitionWithSignal4 annotation(
    Placement(visible = true, transformation(origin = {166, -28}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.StateGraph.Step step1(nIn = 1, nOut = 1) annotation(
    Placement(visible = true, transformation(origin = {144, -28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.TransitionWithSignal transitionWithSignal5 annotation(
    Placement(visible = true, transformation(origin = {228, -28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression2(y = velocity.y <= 0) annotation(
    Placement(visible = true, transformation(origin = {165, -60}, extent = {{-51, -10}, {51, 10}}, rotation = 0)));
  final Modelica.StateGraph.Step step3(nIn = 1, nOut = 1) annotation(
    Placement(visible = true, transformation(origin = {260, -28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.StateGraph.StateGraphRoot stateGraphRoot annotation(
    Placement(visible = true, transformation(origin = {-264, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  when initialStepWithSignal.active then
    acc = 0;
    ang = 0;
  elsewhen step.active then
    acc = 2;
    ang = 0;
  elsewhen stepWithSignal.active then
    acc = 0;
    ang = 30;
  elsewhen stepWithSignal1.active then
    acc = 0;
    ang = 0;
  elsewhen step1.active then
    acc = 3;
    ang = -25;
  elsewhen step2.active then
    acc = -0.5;
    ang = 0;
  elsewhen step3.active then
    acc = 0;
    ang = 0;
  end when;

  connect(realExpression.y, velocity.u) annotation(
    Line(points = {{41, 102}, {52, 102}}, color = {0, 0, 127}));
  connect(direction.y, cos.u) annotation(
    Line(points = {{7, 140}, {50, 140}}, color = {0, 0, 127}));
  connect(cos.y, multiProduct.u[1]) annotation(
    Line(points = {{73, 140}, {87, 140}, {87, 122}}, color = {0, 0, 127}));
  connect(velocity.y, multiProduct.u[2]) annotation(
    Line(points = {{75, 102}, {89, 102}, {89, 122}, {88, 122}}, color = {0, 0, 127}));
  connect(multiProduct.y, pos_x.u) annotation(
    Line(points = {{101.02, 122}, {116.02, 122}}, color = {0, 0, 127}));
  connect(direction.y, sin.u) annotation(
    Line(points = {{7, 140}, {11, 140}, {11, 64}, {51, 64}}, color = {0, 0, 127}));
  connect(sin.y, multiProduct1.u[1]) annotation(
    Line(points = {{75, 64}, {87, 64}, {87, 82}}, color = {0, 0, 127}));
  connect(velocity.y, multiProduct1.u[2]) annotation(
    Line(points = {{75, 102}, {89, 102}, {89, 82}, {88, 82}}, color = {0, 0, 127}));
  connect(multiProduct1.y, pos_y.u) annotation(
    Line(points = {{101.02, 82}, {115.02, 82}}, color = {0, 0, 127}));
  connect(realExpression1.y, from_deg.u) annotation(
    Line(points = {{-107, 140}, {-82, 140}}, color = {0, 0, 127}));
  connect(from_deg.y, direction.u) annotation(
    Line(points = {{-44.4, 140}, {-16.4, 140}}, color = {0, 0, 127}));
  connect(initialStepWithSignal.active, timer.u) annotation(
    Line(points = {{-260, -38}, {-260, -54}, {-254, -54}}, color = {255, 0, 255}));
  connect(timer.y, greaterThreshold.u) annotation(
    Line(points = {{-230, -54}, {-222, -54}}, color = {0, 0, 127}));
  connect(greaterThreshold.y, transitionWithSignal.condition) annotation(
    Line(points = {{-198, -54}, {-188, -54}, {-188, -40}}, color = {255, 0, 255}));
  connect(initialStepWithSignal.outPort[1], transitionWithSignal.inPort) annotation(
    Line(points = {{-250, -28}, {-192, -28}}));
  connect(transitionWithSignal.outPort, step.inPort[1]) annotation(
    Line(points = {{-186, -28}, {-159, -28}}));
  connect(step.outPort[1], transitionWithSignal1.inPort) annotation(
    Line(points = {{-137.5, -28}, {-124, -28}}));
  connect(booleanExpression.y, transitionWithSignal1.condition) annotation(
    Line(points = {{-143, 4}, {-120, 4}, {-120, -16}}, color = {255, 0, 255}));
  connect(transitionWithSignal1.outPort, stepWithSignal.inPort[1]) annotation(
    Line(points = {{-118.5, -28}, {-101, -28}}));
  connect(timer1.y, greaterThreshold1.u) annotation(
    Line(points = {{-49, -54}, {-40, -54}}, color = {0, 0, 127}));
  connect(stepWithSignal.active, timer1.u) annotation(
    Line(points = {{-90, -39}, {-90, -54}, {-72, -54}}, color = {255, 0, 255}));
  connect(greaterThreshold1.y, transitionWithSignal2.condition) annotation(
    Line(points = {{-17, -54}, {-6, -54}, {-6, -40}}, color = {255, 0, 255}));
  connect(stepWithSignal.outPort[1], transitionWithSignal2.inPort) annotation(
    Line(points = {{-79.5, -28}, {-10, -28}}));
  connect(transitionWithSignal2.outPort, stepWithSignal1.inPort[1]) annotation(
    Line(points = {{-4.5, -28}, {23, -28}}));
  connect(greaterThreshold2.y, transitionWithSignal3.condition) annotation(
    Line(points = {{95, -54}, {106, -54}, {106, -40}}, color = {255, 0, 255}));
  connect(timer2.y, greaterThreshold2.u) annotation(
    Line(points = {{63, -54}, {72, -54}}, color = {0, 0, 127}));
  connect(stepWithSignal1.active, timer2.u) annotation(
    Line(points = {{34, -39}, {34, -55}, {40, -55}}, color = {255, 0, 255}));
  connect(stepWithSignal1.outPort[1], transitionWithSignal3.inPort) annotation(
    Line(points = {{44.5, -28}, {102.5, -28}}));
  connect(booleanExpression1.y, transitionWithSignal4.condition) annotation(
    Line(points = {{146, 4}, {166, 4}, {166, -16}}, color = {255, 0, 255}));
  connect(transitionWithSignal3.outPort, step1.inPort[1]) annotation(
    Line(points = {{107.5, -28}, {133, -28}}));
  connect(step1.outPort[1], transitionWithSignal4.inPort) annotation(
    Line(points = {{154.5, -28}, {162, -28}}));
  connect(transitionWithSignal4.outPort, step2.inPort[1]) annotation(
    Line(points = {{167.5, -28}, {185, -28}}));
  connect(booleanExpression2.y, transitionWithSignal5.condition) annotation(
    Line(points = {{221, -60}, {228, -60}, {228, -40}}, color = {255, 0, 255}));
  connect(step2.outPort[1], transitionWithSignal5.inPort) annotation(
    Line(points = {{206.5, -28}, {224, -28}}));
  connect(transitionWithSignal5.outPort, step3.inPort[1]) annotation(
    Line(points = {{229.5, -28}, {249, -28}}));
  annotation(
    uses(Modelica(version = "4.0.0")),
    Diagram(coordinateSystem(extent = {{-300, -300}, {300, 300}})),
    Icon(coordinateSystem(extent = {{-300, -300}, {300, 300}})),
    version = "",
    experiment(StartTime = 0, StopTime = 100, Tolerance = 1e-06, Interval = 0.2));
end vehicle;