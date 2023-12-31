model Impressora2D
  Real destX(start = 12);
  Real destY(start = -6);
  Real origX(start = 0);
  Real origY(start = 0);
  parameter Real Error = 0.1;

  model MotorAceleracao
    parameter Real Error = 0.001;
    parameter Real maxSpeed = 1.0;
    Modelica.Blocks.Interfaces.RealInput orig annotation(
      Placement(transformation(origin = {-120, 64}, extent = {{-20, -20}, {20, 20}}), transformation(origin = {-120, 68}, extent = {{-20, -20}, {20, 20}})));
    Modelica.Blocks.Interfaces.RealInput dest annotation(
      Placement(transformation(origin = {-120, -30}, extent = {{-20, -20}, {20, 20}}), transformation(origin = {-120, -36}, extent = {{-20, -20}, {20, 20}})));
    Modelica.Blocks.Continuous.Integrator pos_change annotation(
      Placement(transformation(origin = {25, 27}, extent = {{-7, -7}, {7, 7}})));
    Modelica.Blocks.Math.Add crt_dist annotation(
      Placement(transformation(origin = {55, 3}, extent = {{-5, -5}, {5, 5}})));
    Modelica.Blocks.Interfaces.RealOutput pos annotation(
      Placement(transformation(origin = {110, 12}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {110, 12}, extent = {{-10, -10}, {10, 10}})));

    model DiscreteController
      parameter Real Error = 0.001;
      parameter Real maxSpeed = 1.0;
      Real initDest(start = 199999.0);
      Real initOrig(start = 199999.0);
      Modelica.Blocks.Sources.RealExpression acceleration(y = 0.3) annotation(
        Placement(transformation(origin = {-63, 87}, extent = {{-7, -7}, {7, 7}})));
      Modelica.Blocks.Sources.RealExpression time_to_full_speed(y = maxSpeed/acceleration.y) annotation(
        Placement(transformation(origin = {-86, -66}, extent = {{-10, -10}, {10, 10}})));
      Modelica.Blocks.Sources.RealExpression dist_to_full_speed(y = (acceleration.y*time_to_full_speed.y*time_to_full_speed.y)/2) annotation(
        Placement(transformation(origin = {-52, -66}, extent = {{-10, -10}, {10, 10}})));
      Modelica.StateGraph.TransitionWithSignal transitionWithSignal annotation(
        Placement(transformation(origin = {-24, 8}, extent = {{-6, -6}, {6, 6}})));
      Modelica.Blocks.Interfaces.RealInput crt_speed annotation(
        Placement(transformation(origin = {-109, -5}, extent = {{-9, -9}, {9, 9}}), transformation(origin = {-109, -1}, extent = {{-9, -9}, {9, 9}})));
      Modelica.StateGraph.Step constantSpeed(nIn = 1, nOut = 1) annotation(
        Placement(transformation(origin = {0, 8}, extent = {{-6, -6}, {6, 6}})));
      Modelica.StateGraph.TransitionWithSignal transitionWithSignal1 annotation(
        Placement(transformation(origin = {24, 8}, extent = {{-6, -6}, {6, 6}})));
      Modelica.Blocks.Interfaces.RealInput crt_pos annotation(
        Placement(transformation(origin = {-109, 61}, extent = {{-9, -9}, {9, 9}}), transformation(origin = {-109, 73}, extent = {{-9, -9}, {9, 9}})));
      Modelica.Blocks.Interfaces.RealInput dest annotation(
        Placement(transformation(origin = {-110, -28}, extent = {{-10, -10}, {10, 10}}), transformation(origin = {-109, -51}, extent = {{-9, -9}, {9, 9}})));
      Modelica.Blocks.Sources.BooleanExpression reverseAccelerationCondition(y = abs(dest - crt_pos) <= dist_to_full_speed.y) annotation(
        Placement(transformation(origin = {-4, -12}, extent = {{-12, -12}, {12, 12}})));
      Modelica.StateGraph.Step braking(nIn = 2, nOut = 1) annotation(
        Placement(transformation(origin = {44, 8}, extent = {{-6, -6}, {6, 6}})));
      Modelica.StateGraph.TransitionWithSignal transitionWithSignal2 annotation(
        Placement(transformation(origin = {64, 8}, extent = {{-6, -6}, {6, 6}})));
      Modelica.Blocks.Sources.BooleanExpression stopCondition(y = (crt_speed > -Error) and crt_speed < Error) annotation(
        Placement(transformation(origin = {44, -12}, extent = {{-8, -8}, {8, 8}})));
      Modelica.StateGraph.InitialStep waitingInput(nOut = 1, nIn = 1) annotation(
        Placement(transformation(origin = {-82, 8}, extent = {{-6, -6}, {6, 6}})));
      Modelica.StateGraph.TransitionWithSignal transitionWithSignal3 annotation(
        Placement(transformation(origin = {-62, 8}, extent = {{-6, -6}, {6, 6}})));
      Modelica.StateGraph.Step accelerate(nIn = 1, nOut = 2) annotation(
        Placement(transformation(origin = {-44, 8}, extent = {{-6, -6}, {6, 6}})));
      Modelica.Blocks.Sources.BooleanExpression newInput(y = (abs(dest) > abs(initDest) + Error) or (abs(dest) < abs(initDest) - Error)) annotation(
        Placement(transformation(origin = {-73, -11}, extent = {{-7, -7}, {7, 7}})));
      Modelica.Blocks.Interfaces.RealOutput accel_out annotation(
        Placement(transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}), transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}})));
      Modelica.Blocks.Interfaces.RealInput orig annotation(
        Placement(transformation(origin = {-109, 33}, extent = {{-9, -9}, {9, 9}}), transformation(origin = {-109, 37}, extent = {{-9, -9}, {9, 9}})));
      Modelica.Blocks.Sources.BooleanExpression booleanExpression(y = initDest > initOrig) annotation(
        Placement(transformation(origin = {-63, 75}, extent = {{-7, -7}, {7, 7}})));
      Modelica.Blocks.Logical.Switch relativeAccel annotation(
        Placement(transformation(origin = {-38, 74}, extent = {{-6, -6}, {6, 6}})));
      Modelica.Blocks.Sources.RealExpression negAcceleration(y = -0.3) annotation(
        Placement(transformation(origin = {-63, 61}, extent = {{-7, -7}, {7, 7}})));
      Modelica.Blocks.Sources.BooleanExpression stopAccelCondition(y = abs(crt_speed) >= maxSpeed) annotation(
        Placement(transformation(origin = {-45, -11}, extent = {{-7, -7}, {7, 7}})));
      Modelica.StateGraph.TransitionWithSignal transitionWithSignal4 annotation(
        Placement(transformation(origin = {-24, 46}, extent = {{-6, -6}, {6, 6}})));
      Modelica.Blocks.Sources.BooleanExpression booleanExpression1(y = abs(crt_pos - initOrig) >= abs(initDest - initOrig)/2) annotation(
        Placement(transformation(origin = {-55, 25}, extent = {{-7, -7}, {7, 7}})));
    equation
      when accelerate.active then
        accel_out = relativeAccel.y;
        initDest = dest;
        initOrig = orig;
      elsewhen constantSpeed.active then
        accel_out = 0.0;
        initDest = initDest;
        initOrig = initOrig;
      elsewhen braking.active then
        accel_out = -1*relativeAccel.y;
        initDest = initDest;
        initOrig = initOrig;
      elsewhen waitingInput.active then
        accel_out = 0.0;
        initDest = initDest;
        initOrig = initOrig;
      end when;
      connect(transitionWithSignal.outPort, constantSpeed.inPort[1]) annotation(
        Line(points = {{-23.1, 8}, {-6.1, 8}}));
      connect(constantSpeed.outPort[1], transitionWithSignal1.inPort) annotation(
        Line(points = {{6.3, 8}, {22.3, 8}}));
      connect(reverseAccelerationCondition.y, transitionWithSignal1.condition) annotation(
        Line(points = {{9.2, -12}, {24.2, -12}, {24.2, -15}}, color = {255, 0, 255}));
      connect(transitionWithSignal1.outPort, braking.inPort[1]) annotation(
        Line(points = {{24.9, 8}, {38.9, 8}}));
      connect(braking.outPort[1], transitionWithSignal2.inPort) annotation(
        Line(points = {{50.3, 8}, {62.3, 8}}));
      connect(stopCondition.y, transitionWithSignal2.condition) annotation(
        Line(points = {{52.8, -12}, {63.8, -12}, {63.8, 0}}, color = {255, 0, 255}));
      connect(waitingInput.outPort[1], transitionWithSignal3.inPort) annotation(
        Line(points = {{-75.7, 8}, {-63.7, 8}}));
      connect(transitionWithSignal3.outPort, accelerate.inPort[1]) annotation(
        Line(points = {{-61.1, 8}, {-49.1, 8}}));
      connect(accelerate.outPort[1], transitionWithSignal.inPort) annotation(
        Line(points = {{-38, 8}, {-26, 8}}));
      connect(transitionWithSignal2.outPort, waitingInput.inPort[1]) annotation(
        Line(points = {{64, 8}, {82, 8}, {82, 34}, {-96, 34}, {-96, 8}, {-88, 8}}));
      connect(newInput.y, transitionWithSignal3.condition) annotation(
        Line(points = {{-65, -11}, {-62, -11}, {-62, 0}}, color = {255, 0, 255}));
      connect(booleanExpression.y, relativeAccel.u2) annotation(
        Line(points = {{-56, 76}, {-51.5, 76}, {-51.5, 74}, {-45, 74}}, color = {255, 0, 255}));
      connect(negAcceleration.y, relativeAccel.u3) annotation(
        Line(points = {{-55, 61}, {-45, 61}, {-45, 69}}, color = {0, 0, 127}));
      connect(acceleration.y, relativeAccel.u1) annotation(
        Line(points = {{-56, 88}, {-45, 88}, {-45, 79}}, color = {0, 0, 127}));
      connect(stopAccelCondition.y, transitionWithSignal.condition) annotation(
        Line(points = {{-38, -10}, {-24, -10}, {-24, 0}}, color = {255, 0, 255}));
      connect(booleanExpression1.y, transitionWithSignal4.condition) annotation(
        Line(points = {{-48, 26}, {-24, 26}, {-24, 38}}, color = {255, 0, 255}));
      connect(accelerate.outPort[2], transitionWithSignal4.inPort) annotation(
        Line(points = {{-38, 8}, {-32, 8}, {-32, 46}, {-26, 46}}));
      connect(transitionWithSignal4.outPort, braking.inPort[2]) annotation(
        Line(points = {{-24, 46}, {32, 46}, {32, 8}, {38, 8}}));
    end DiscreteController;

    MotorAceleracao.DiscreteController discreteController annotation(
      Placement(transformation(origin = {-42, 42}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Continuous.Integrator velocity annotation(
      Placement(transformation(origin = {-3, 41}, extent = {{-7, -7}, {7, 7}})));
    Modelica.Blocks.Interfaces.RealInput initialOrig annotation(
      Placement(transformation(origin = {-120, 6}, extent = {{-20, -20}, {20, 20}}), transformation(origin = {-120, 14}, extent = {{-20, -20}, {20, 20}})));
  equation
    connect(crt_dist.u2, pos_change.y) annotation(
      Line(points = {{49, 0}, {49, 2}, {33, 2}, {33, 27}}, color = {0, 0, 127}));
    connect(pos, crt_dist.y) annotation(
      Line(points = {{110, 12}, {60, 12}, {60, 4}}, color = {0, 0, 127}));
    connect(crt_dist.y, discreteController.crt_pos) annotation(
      Line(points = {{60, 4}, {70, 4}, {70, 62}, {-60, 62}, {-60, 48}, {-52, 48}}, color = {0, 0, 127}));
    connect(discreteController.accel_out, velocity.u) annotation(
      Line(points = {{-30, 42}, {-12, 42}}, color = {0, 0, 127}));
    connect(velocity.y, discreteController.crt_speed) annotation(
      Line(points = {{4, 42}, {14, 42}, {14, 58}, {-74, 58}, {-74, 42}, {-52, 42}}, color = {0, 0, 127}));
    connect(dest, discreteController.dest) annotation(
      Line(points = {{-120, -36}, {-96, -36}, {-96, 36}, {-52, 36}}, color = {0, 0, 127}));
    connect(velocity.y, pos_change.u) annotation(
      Line(points = {{4, 42}, {8, 42}, {8, 28}, {16, 28}}, color = {0, 0, 127}));
    connect(orig, discreteController.orig) annotation(
      Line(points = {{-120, 64}, {-80, 64}, {-80, 46}, {-52, 46}}, color = {0, 0, 127}));
  connect(initialOrig, crt_dist.u1) annotation(
      Line(points = {{-120, 6}, {50, 6}}, color = {0, 0, 127}));
    annotation(
      Diagram);
  end MotorAceleracao;

  Impressora2D.MotorAceleracao motorAceleracaoY annotation(
    Placement(transformation(origin = {-32, -10}, extent = {{-10, -10}, {10, 10}})));
  Modelica.StateGraph.InitialStep initialStep(nIn = 1, nOut = 1) annotation(
    Placement(transformation(origin = {-87, -57}, extent = {{-7, -7}, {7, 7}})));
  Modelica.StateGraph.TransitionWithSignal transitionWithSignal annotation(
    Placement(transformation(origin = {-65, -57}, extent = {{-7, -7}, {7, 7}})));
  Modelica.StateGraph.Step step(nIn = 1, nOut = 1) annotation(
    Placement(transformation(origin = {-41, -57}, extent = {{-7, -7}, {7, 7}})));
  Modelica.StateGraph.Step step1(nIn = 1, nOut = 1) annotation(
    Placement(transformation(origin = {15, -57}, extent = {{-7, -7}, {7, 7}})));
  Modelica.StateGraph.TransitionWithSignal transitionWithSignal1 annotation(
    Placement(transformation(origin = {-13, -57}, extent = {{-7, -7}, {7, 7}})));
  Modelica.StateGraph.TransitionWithSignal transitionWithSignal2 annotation(
    Placement(transformation(origin = {39, -57}, extent = {{-7, -7}, {7, 7}})));
  Modelica.Blocks.Sources.BooleanExpression arrivalCheck(y = (abs(motorAceleracaoX.pos) <= abs(destX) + Error and abs(motorAceleracaoX.pos) >= abs(destX) - Error) and abs(motorAceleracaoY.pos) <= abs(destY) + Error and abs(motorAceleracaoY.pos) >= abs(destY) - Error) annotation(
    Placement(transformation(origin = {-81, -79}, extent = {{-9, -9}, {9, 9}})));
  Impressora2D.MotorAceleracao motorAceleracaoX annotation(
    Placement(transformation(origin = {-32, 32}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.RealExpression origemExX(y = origX) annotation(
    Placement(transformation(origin = {-86, 50}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.RealExpression destExX(y = destX) annotation(
    Placement(transformation(origin = {-88, 20}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.RealExpression origemExY(y = origY) annotation(
    Placement(transformation(origin = {-86, 4}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.RealExpression destExY(y = destY) annotation(
    Placement(transformation(origin = {-88, -22}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.RealExpression realExpression(y = 0) annotation(
    Placement(transformation(origin = {-73, 33}, extent = {{-7, -7}, {7, 7}})));
  Modelica.Blocks.Sources.RealExpression realExpression1(y = 0) annotation(
    Placement(transformation(origin = {-75, -9}, extent = {{-7, -7}, {7, 7}})));
equation
  when initialStep.active then
    destX = 12.0;
    destY = -6.0;
    origX = 0;
    origY = 0;
  elsewhen step.active then
    destX = 15;
    destY = 10;
    origX = 12;
    origY = -6;
  elsewhen step1.active then
    destX = 0;
    destY = 0;
    origX = 15;
    origY = 10;
  end when;
  connect(transitionWithSignal2.outPort, initialStep.inPort[1]) annotation(
    Line(points = {{40, -56}, {60, -56}, {60, -32}, {-96, -32}, {-96, -57}, {-95, -57}}));
  connect(initialStep.outPort[1], transitionWithSignal.inPort) annotation(
    Line(points = {{-80, -57}, {-72, -57}, {-72, -56}, {-68, -56}}));
  connect(transitionWithSignal.outPort, step.inPort[1]) annotation(
    Line(points = {{-64, -56}, {-48, -56}}));
  connect(step.outPort[1], transitionWithSignal1.inPort) annotation(
    Line(points = {{-34, -56}, {-16, -56}}));
  connect(transitionWithSignal1.outPort, step1.inPort[1]) annotation(
    Line(points = {{-12, -56}, {8, -56}}));
  connect(step1.outPort[1], transitionWithSignal2.inPort) annotation(
    Line(points = {{22, -56}, {36, -56}}));
  connect(arrivalCheck.y, transitionWithSignal.condition) annotation(
    Line(points = {{-72, -78}, {-64, -78}, {-64, -66}}, color = {255, 0, 255}));
  connect(arrivalCheck.y, transitionWithSignal1.condition) annotation(
    Line(points = {{-72, -78}, {-12, -78}, {-12, -66}}, color = {255, 0, 255}));
  connect(arrivalCheck.y, transitionWithSignal2.condition) annotation(
    Line(points = {{-72, -78}, {40, -78}, {40, -66}}, color = {255, 0, 255}));
  connect(origemExX.y, motorAceleracaoX.orig) annotation(
    Line(points = {{-75, 50}, {-75, 39}, {-44, 39}}, color = {0, 0, 127}));
  connect(destExX.y, motorAceleracaoX.dest) annotation(
    Line(points = {{-77, 20}, {-56, 20}, {-56, 28}, {-44, 28}}, color = {0, 0, 127}));
  connect(origemExY.y, motorAceleracaoY.orig) annotation(
    Line(points = {{-75, 4}, {-64, 4}, {-64, -3}, {-44, -3}}, color = {0, 0, 127}));
  connect(destExY.y, motorAceleracaoY.dest) annotation(
    Line(points = {{-77, -22}, {-54, -22}, {-54, -14}, {-44, -14}}, color = {0, 0, 127}));
  connect(realExpression.y, motorAceleracaoX.initialOrig) annotation(
    Line(points = {{-66, 34}, {-66, 31}, {-44, 31}, {-44, 33}}, color = {0, 0, 127}));
  connect(realExpression1.y, motorAceleracaoY.initialOrig) annotation(
    Line(points = {{-68, -8}, {-44, -8}}, color = {0, 0, 127}));
  annotation(
    uses(Modelica(version = "4.0.0")),
    Diagram);
end Impressora2D;