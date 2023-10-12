model Impressora2D
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

  Modelica.Blocks.Sources.RealExpression origemX(y = 10) annotation(
    Placement(transformation(origin = {-86, 26}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.RealExpression destinoX(y = 0) annotation(
    Placement(transformation(origin = {-86, 42}, extent = {{-10, -10}, {10, 10}})));
  Impressora2D.Motor motorX annotation(
    Placement(transformation(origin = {-32, 32}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.RealExpression origemY(y = 5) annotation(
    Placement(transformation(origin = {-84, -14}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.RealExpression destinoY(y = 2) annotation(
    Placement(transformation(origin = {-84, 2}, extent = {{-10, -10}, {10, 10}})));
  Impressora2D.Motor motorY annotation(
    Placement(transformation(origin = {-32, -4}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(motorX.destino, destinoX.y) annotation(
    Line(points = {{-44, 35}, {-44, 34}, {-74, 34}, {-74, 42}}, color = {0, 0, 127}));
  connect(motorX.origem, origemX.y) annotation(
    Line(points = {{-44, 29}, {-44, 30}, {-74, 30}, {-74, 26}}, color = {0, 0, 127}));
  connect(motorY.destino, destinoY.y) annotation(
    Line(points = {{-44, -1}, {-44, -2}, {-72, -2}, {-72, 2}}, color = {0, 0, 127}));
  connect(motorY.origem, origemY.y) annotation(
    Line(points = {{-44, -7}, {-44, -6}, {-72, -6}, {-72, -14}}, color = {0, 0, 127}));
  annotation(
    uses(Modelica(version = "4.0.0")));
end Impressora2D;