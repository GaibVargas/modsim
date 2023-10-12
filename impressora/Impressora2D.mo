model Impressora2D

  model MotorAceleracao
    parameter Real Error = 0.01;
    parameter Real maxSpeed = 1.0;
    Modelica.Blocks.Interfaces.RealInput orig annotation(
      Placement(transformation(origin = {-120, 64}, extent = {{-20, -20}, {20, 20}}), transformation(origin = {-120, 68}, extent = {{-20, -20}, {20, 20}})));
    Modelica.Blocks.Interfaces.RealInput dest annotation(
      Placement(transformation(origin = {-120, -2}, extent = {{-20, -20}, {20, 20}}), transformation(origin = {-120, -36}, extent = {{-20, -20}, {20, 20}})));
  Modelica.Blocks.Math.Add dist(k1 = -1)  annotation(
      Placement(transformation(origin = {-51, 9}, extent = {{-5, -5}, {5, 5}})));
  Modelica.Blocks.Sources.RealExpression time_to_full_speed(y = maxSpeed/acceleration.y)  annotation(
      Placement(transformation(origin = {-82, -16}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.RealExpression acceleration(y = 0.3)  annotation(
      Placement(transformation(origin = {-83, 35}, extent = {{-9, -9}, {9, 9}})));
  Modelica.Blocks.Sources.RealExpression dist_to_full_speed(y = (acceleration.y*time_to_full_speed.y*time_to_full_speed.y)/2)  annotation(
      Placement(transformation(origin = {-48, -16}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.RealExpression dist_int_const(y = dist.y - (dist_to_full_speed.y*2))  annotation(
      Placement(transformation(origin = {-48, -32}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Continuous.LimIntegrator velocity(outMax = maxSpeed, outMin = -maxSpeed)  annotation(
      Placement(transformation(origin = {-1, 41}, extent = {{-7, -7}, {7, 7}})));
  Modelica.Blocks.Logical.Switch brake annotation(
      Placement(transformation(origin = {-46, 52}, extent = {{-6, -6}, {6, 6}})));
  Modelica.Blocks.Sources.RealExpression neg_acceleration(y = -0.3)  annotation(
      Placement(transformation(origin = {-75, 71}, extent = {{-9, -9}, {9, 9}})));
  Modelica.Blocks.Sources.BooleanExpression brakeCondition(y = (dist_int_const.y < 0 and abs(pos_change.y)  >= abs((dist.y/2))) or (crt_dist.y + dist_to_full_speed.y > dest))  annotation(
      Placement(transformation(origin = {-84, 52}, extent = {{-8, -8}, {8, 8}})));
  Modelica.Blocks.Logical.Switch stop annotation(
      Placement(transformation(origin = {-25, 43}, extent = {{-5, -5}, {5, 5}})));
  Modelica.Blocks.Sources.RealExpression zero annotation(
      Placement(transformation(origin = {-45, 29}, extent = {{-7, -7}, {7, 7}})));
  Modelica.Blocks.Sources.BooleanExpression stopCond(y = (crt_dist.y <= dest + Error) and (crt_dist.y >= dest - Error))  annotation(
      Placement(transformation(origin = {-50, 38}, extent = {{-6, -6}, {6, 6}})));
  Modelica.Blocks.Continuous.Integrator pos_change annotation(
      Placement(transformation(origin = {25, 25}, extent = {{-7, -7}, {7, 7}})));
  Modelica.Blocks.Math.Add crt_dist annotation(
      Placement(transformation(origin = {55, 3}, extent = {{-5, -5}, {5, 5}})));
  Modelica.Blocks.Interfaces.RealOutput pos annotation(
      Placement(transformation(origin = {110, 12}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {110, 12}, extent = {{-10, -10}, {10, 10}})));
  equation
    connect(dist.u1, orig) annotation(
      Line(points = {{-57, 12}, {-57, 64}, {-120, 64}}, color = {0, 0, 127}));
    connect(dist.u2, dest) annotation(
      Line(points = {{-57, 6}, {-57, -2}, {-120, -2}}, color = {0, 0, 127}));
    connect(brake.u2, brakeCondition.y) annotation(
      Line(points = {{-54, 52}, {-76, 52}}, color = {255, 0, 255}));
    connect(stop.u2, stopCond.y) annotation(
      Line(points = {{-31, 43}, {-43, 43}, {-43, 38}}, color = {255, 0, 255}));
    connect(velocity.u, stop.y) annotation(
      Line(points = {{-9, 41}, {-14, 41}, {-14, 44}, {-20, 44}}, color = {0, 0, 127}));
    connect(pos_change.u, velocity.y) annotation(
      Line(points = {{17, 25}, {11, 25}, {11, 41}, {7, 41}}, color = {0, 0, 127}));
  connect(orig, crt_dist.u1) annotation(
      Line(points = {{-120, 64}, {-120, 20}, {0, 20}, {0, 13}, {49, 13}, {49, 6}}, color = {0, 0, 127}));
  connect(crt_dist.u2, pos_change.y) annotation(
      Line(points = {{49, 0}, {33, 0}, {33, 25}}, color = {0, 0, 127}));
  connect(pos, crt_dist.y) annotation(
      Line(points = {{110, 12}, {60, 12}, {60, 4}}, color = {0, 0, 127}));
  connect(brake.u1, neg_acceleration.y) annotation(
      Line(points = {{-54, 56}, {-66, 56}, {-66, 72}}, color = {0, 0, 127}));
  connect(brake.u3, acceleration.y) annotation(
      Line(points = {{-54, 48}, {-73, 48}, {-73, 35}}, color = {0, 0, 127}));
  connect(stop.u1, zero.y) annotation(
      Line(points = {{-30, 48}, {-38, 47}, {-37, 29}}, color = {0, 0, 127}));
  connect(stop.u3, brake.y) annotation(
      Line(points = {{-30, 40}, {-40, 40}, {-40, 52}}, color = {0, 0, 127}));
    annotation(
      Diagram);end MotorAceleracao;
  model Motor
    Real Error = 0.000001;
    Modelica.Blocks.Interfaces.RealInput destino annotation(
      Placement(transformation(origin = {-120, 2}, extent = {{-20, -20}, {20, 20}}), transformation(origin = {-120, 28}, extent = {{-20, -20}, {20, 20}})));
    Modelica.Blocks.Math.Add velocity(k2 = -1) annotation(
      Placement(transformation(origin = {-60, -22}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Interfaces.RealInput origem annotation(
      Placement(transformation(origin = {-126, -28}, extent = {{-20, -20}, {20, 20}}), transformation(origin = {-120, -30}, extent = {{-20, -20}, {20, 20}})));
    Modelica.Blocks.Continuous.Integrator position_change annotation(
      Placement(transformation(origin = {10, -2}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Sources.RealExpression zero annotation(
      Placement(transformation(origin = {-62, 16}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Logical.Switch velocity_switch annotation(
      Placement(transformation(origin = {-23, -1}, extent = {{-7, -7}, {7, 7}})));
    Modelica.Blocks.Sources.BooleanExpression breakCondition(y = (position.y <= destino + Error) and (position.y >= destino - Error)) annotation(
      Placement(transformation(origin = {-67, -1}, extent = {{-9, -9}, {9, 9}})));
    Modelica.Blocks.Math.Add position annotation(
      Placement(transformation(origin = {54, -10}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Interfaces.RealOutput crt_position annotation(
      Placement(transformation(origin = {110, -10}, extent = {{-10, -10}, {10, 10}}), transformation(origin = {110, 2}, extent = {{-10, -10}, {10, 10}})));

    model velCalculator
      Modelica.Blocks.Interfaces.RealInput dist annotation(
        Placement(transformation(origin = {-112, -2}, extent = {{-10, -10}, {10, 10}}), transformation(origin = {-114, 2}, extent = {{-20, -20}, {20, 20}})));
    equation

    end velCalculator;
  equation
    connect(velocity.u1, destino) annotation(
      Line(points = {{-72, -16}, {-93, -16}, {-93, 2}, {-120, 2}}, color = {0, 0, 127}));
    connect(velocity.u2, origem) annotation(
      Line(points = {{-72, -28}, {-96, -28}, {-96, -26}, {-120, -26}}, color = {0, 0, 127}));
    connect(velocity_switch.u1, zero.y) annotation(
      Line(points = {{-31, 5}, {-43, 5}, {-43, 16.5}, {-51, 16.5}, {-51, 16}}, color = {0, 0, 127}));
    connect(velocity_switch.u3, velocity.y) annotation(
      Line(points = {{-31, -7}, {-40, -7}, {-40, -19}, {-49, -19}, {-49, -22}}, color = {0, 0, 127}));
    connect(position_change.u, velocity_switch.y) annotation(
      Line(points = {{-2, -2}, {-16, -2}, {-16, 0}}, color = {0, 0, 127}));
    connect(position.u1, position_change.y) annotation(
      Line(points = {{42, -4}, {22, -4}, {22, -2}}, color = {0, 0, 127}));
    connect(position.u2, origem) annotation(
      Line(points = {{42, -16}, {30, -16}, {30, -24}, {-34, -24}, {-34, -36}, {-82, -36}, {-82, -30}, {-120, -30}, {-120, -26}}, color = {0, 0, 127}));
    connect(velocity_switch.u2, breakCondition.y) annotation(
      Line(points = {{-32, 0}, {-58, 0}}, color = {255, 0, 255}));
    connect(crt_position, position.y) annotation(
      Line(points = {{110, -10}, {66, -10}}, color = {0, 0, 127}));
    annotation(
      Diagram);
  end Motor;

  Modelica.Blocks.Sources.RealExpression origemX(y = 3) annotation(
    Placement(transformation(origin = {-88, 50}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.RealExpression destinoX(y = 12) annotation(
    Placement(transformation(origin = {-88, 30}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.RealExpression origemY(y = 5) annotation(
    Placement(transformation(origin = {-86, 6}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.RealExpression destinoY(y = 2) annotation(
    Placement(transformation(origin = {-86, -12}, extent = {{-10, -10}, {10, 10}})));
  Impressora2D.MotorAceleracao motorAceleracaox annotation(
    Placement(transformation(origin = {-34, 34}, extent = {{-10, -10}, {10, 10}})));
  Impressora2D.MotorAceleracao motorAceleracaoy annotation(
    Placement(transformation(origin = {-32, 0}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(motorAceleracaox.orig, origemX.y) annotation(
    Line(points = {{-46, 40}, {-76, 40}, {-76, 50}}, color = {0, 0, 127}));
  connect(motorAceleracaox.dest, destinoX.y) annotation(
    Line(points = {{-46, 30}, {-76, 30}}, color = {0, 0, 127}));
  connect(motorAceleracaoy.orig, origemY.y) annotation(
    Line(points = {{-44, 6}, {-74, 6}}, color = {0, 0, 127}));
  connect(motorAceleracaoy.dest, destinoY.y) annotation(
    Line(points = {{-44, -4}, {-74, -4}, {-74, -12}}, color = {0, 0, 127}));
  annotation(
    uses(Modelica(version = "4.0.0")));
end Impressora2D;