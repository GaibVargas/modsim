model Impressora
  Modelica.Blocks.Sources.RealExpression destX(y = 5) annotation(
    Placement(transformation(origin = {-80, 28}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.RealExpression destY(y = 4) annotation(
    Placement(transformation(origin = {-80, -6}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.RealExpression origX(y = 0) annotation(
    Placement(transformation(origin = {-80, 42}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.RealExpression origY(y = 0) annotation(
    Placement(transformation(origin = {-80, 8}, extent = {{-10, -10}, {10, 10}})));

  model ImpressoraMotor
    Modelica.Blocks.Interfaces.RealInput orig annotation(
      Placement(transformation(origin = {-122, 38}, extent = {{-20, -20}, {20, 20}}), transformation(origin = {-120, 44}, extent = {{-20, -20}, {20, 20}})));
    Modelica.Blocks.Interfaces.RealInput dest annotation(
      Placement(transformation(origin = {-122, -24}, extent = {{-20, -20}, {20, 20}}), transformation(origin = {-120, -52}, extent = {{-20, -20}, {20, 20}})));
    Modelica.Blocks.Math.Add add(k1 = -1) annotation(
      Placement(transformation(origin = {-78, 24}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Continuous.Integrator posChange annotation(
      Placement(transformation(origin = {-24, 54}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Logical.GreaterEqual greaterEqual annotation(
      Placement(transformation(origin = {4, 40}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Math.Abs abs annotation(
      Placement(transformation(origin = {-46, 24}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Logical.Switch switch1 annotation(
      Placement(transformation(origin = {50, 40}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Math.Add add1(k1 = +1) annotation(
      Placement(transformation(origin = {84, 12}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Interfaces.RealOutput motorPos annotation(
      Placement(transformation(origin = {110, 12}, extent = {{-10, -10}, {10, 10}}), transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Logical.Not negate annotation(
      Placement(transformation(origin = {24, 40}, extent = {{-4, -4}, {4, 4}})));
  equation
    connect(add.u1, orig) annotation(
      Line(points = {{-90, 30}, {-102, 30}, {-102, 38}, {-122, 38}}, color = {0, 0, 127}));
    connect(add.u2, dest) annotation(
      Line(points = {{-90, 18}, {-90, -24}, {-122, -24}}, color = {0, 0, 127}));
    connect(greaterEqual.u1, posChange.y) annotation(
      Line(points = {{-8, 40}, {-8, 44}, {-13, 44}, {-13, 54}}, color = {0, 0, 127}));
    connect(abs.u, add.y) annotation(
      Line(points = {{-58, 24}, {-67, 24}}, color = {0, 0, 127}));
    connect(greaterEqual.u2, abs.y) annotation(
      Line(points = {{-8, 32}, {-8, 36}, {-34, 36}, {-34, 24}}, color = {0, 0, 127}));
    connect(switch1.u1, posChange.y) annotation(
      Line(points = {{38, 48}, {17, 48}, {17, 60}, {-9.5, 60}, {-9.5, 54}, {-13, 54}}, color = {0, 0, 127}));
    connect(add1.u1, switch1.y) annotation(
      Line(points = {{72, 18}, {66, 18}, {66, 40}, {61, 40}}, color = {0, 0, 127}));
    connect(add1.u2, orig) annotation(
      Line(points = {{72, 6}, {46, 6}, {46, -32}, {-50, -32}, {-50, -4}, {-96, -4}, {-96, 38}, {-122, 38}}, color = {0, 0, 127}));
    connect(add1.y, motorPos) annotation(
      Line(points = {{95, 12}, {110, 12}}, color = {0, 0, 127}));
    connect(negate.u, greaterEqual.y) annotation(
      Line(points = {{19, 40}, {15, 40}}, color = {255, 0, 255}));
    connect(switch1.u2, negate.y) annotation(
      Line(points = {{38, 40}, {28, 40}}, color = {255, 0, 255}));
    connect(switch1.u3, dest) annotation(
      Line(points = {{38, 32}, {26, 32}, {26, -24}, {-122, -24}}, color = {0, 0, 127}));
  connect(posChange.u, abs.y) annotation(
      Line(points = {{-36, 54}, {-36, 39}, {-34, 39}, {-34, 24}}, color = {0, 0, 127}));
    annotation(
      Diagram);
  end ImpressoraMotor;

  Modelica.Blocks.Interfaces.RealOutput pos_x annotation(
    Placement(transformation(origin = {110, 38}, extent = {{-10, -10}, {10, 10}}), transformation(origin = {108, 30}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interfaces.RealOutput pos_y annotation(
    Placement(transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}), transformation(origin = {106, 4}, extent = {{-10, -10}, {10, 10}})));
  Impressora.ImpressoraMotor mX annotation(
    Placement(transformation(origin = {-26, 42}, extent = {{-10, -10}, {10, 10}})));
  Impressora.ImpressoraMotor mY annotation(
    Placement(transformation(origin = {-24, 0}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(mX.orig, origX.y) annotation(
    Line(points = {{-38, 46}, {-68, 46}, {-68, 42}}, color = {0, 0, 127}));
  connect(mX.dest, destX.y) annotation(
    Line(points = {{-38, 36}, {-68, 36}, {-68, 28}}, color = {0, 0, 127}));
  connect(pos_x, mX.motorPos) annotation(
    Line(points = {{110, 38}, {-14, 38}, {-14, 42}}, color = {0, 0, 127}));
  connect(mY.orig, origY.y) annotation(
    Line(points = {{-36, 4}, {-68, 4}, {-68, 8}}, color = {0, 0, 127}));
  connect(mY.dest, destY.y) annotation(
    Line(points = {{-36, -6}, {-68, -6}}, color = {0, 0, 127}));
  connect(pos_y, mY.motorPos) annotation(
    Line(points = {{110, 0}, {-12, 0}}, color = {0, 0, 127}));
  annotation(
    uses(Modelica(version = "4.0.0")),
    Diagram);
end Impressora;