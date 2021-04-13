const
  A = 20; // относительное рассто€ние по отношению к сигме
  B = 20; // относительное рассто€ние по отношению к сигме
  N = 10; // количество частиц
  dt = 1; // безразмерна€ величина примерно равна€ 2е-16 с
  si = 3.667 * 1e-14;       //дл€ азота
  eps = 99.8 * 1.3807 * 1e-23; //N2
  mN2 = 4.65 * 1e-26;
  Kb = 1.3807 * 1e-23;
  Vmax = 4; //относителан€ скорость скорость деленна€ на веро€тную 

type
  particle = record
    ax: double;
    ay: double;
    vx: double;
    vy: double;
    x: double;
    y: double;
  end;
  
  par = record
    ax: double;
    ay: double;
  end;
  
  force = record
    x: double;
    y: double;
  end;
  
  Tancambl = array[1..N] of particle;

procedure generate(var m: Tancambl);
var
  i: integer;
  r, f: double;
begin
  for i := 1 to N do 
  begin
    m[i].x := A*random; // в относительных величинах
    m[i].y := B*random; // в относительных величинах
    r := random; f := random;
    m[i].vx := vmax * cos(2 * pi * r) * sqrt(-ln(f)); // в относительных величинах
    m[i].vy := vmax * sin(2 * pi * r) * sqrt(-ln(f)); // в относительных величинах
  end; 
end;

procedure balance(var m: Tancambl);
var 
  sumVx, sumVy : real;
  i            :integer;
begin
  sumVx:=0; sumVy:=0;
  for i:=1 to N do begin
   sumVx:=sumVx+m[i].vx;
   sumVy:=sumVy+m[i].vy;
  end;
  if sumVx <> 0 then
   for i:=1 to N do m[i].vx - sumVx/N;
  if sumVy <> 0 then
   for i:=1 to N do m[i].vy - sumVy/N;
end;
  
procedure interaction(var m: Tancambl; p: integer);
var
  i, j: integer;
  rij, sumFX, sumFY, cosx, sinx: double;
  Fi: array[1..N - 1] of force; 
  ai: array[1..N] of par;
begin
  if p = 1 then
    for i := 1 to N do 
    begin
      for j := 1 to N do 
      begin
        if i <> j then begin
          rij:=sqrt(sqr(m[j].x-m[i].x)+sqr(m[j].y-m[i].y));
          cosx:=cos(arctan((m[j].y-m[i].y)/(m[j].x-m[i].x)));
          sinx:=sin(arctan((m[j].y-m[i].y)/(m[j].x-m[i].x)));
          sumFX:=sumFX + cosx * 24 * (2/exp(13*ln(rij))-1/exp(7*ln(rij)));
          sumFY:=sumFY + sinx * 24 * (2/exp(13*ln(rij))-1/exp(7*ln(rij)));
        end;
      end;
      sumfx := 0; sumfy := 0;
      for j := 1 to N - 1 do 
      begin
        sumfx := Fi[j].x + sumfx;
        sumfy := Fi[j].y + sumfy;
      end;
      m[i].ax := sumfx {/ mN2};
      m[i].ay := sumfy {/ mN2};
    end;
  for i := 1 to N do 
  begin//новые координаты n+1
    m[i].x := m[i].x + m[i].vx * dt + 0.5 * m[i].ax * sqr(dt);
    m[i].y := m[i].y + m[i].vy * dt + 0.5 * m[i].ay * sqr(dt);
  end;
  for i := 1 to N do 
  begin//сохранненые n-ые ускорени€
    ai[i].ax := m[i].ax;
    ai[i].ay := m[i].ay;
  end;
  for i := 1 to N do 
  begin//новые ускорени€ n+1
    k := 1;
    for j := 1 to N do 
    begin
      if i <> j then begin
        Fi[k].x := {eps *} (m[j].x - m[i].x) * 4 * (12 {* si12} / exp(14 * ln(sqrt(sqr(m[i].x - m[j].x) + sqr(m[i].y - m[j].y)))) - 6 {* si6} / exp(8 * ln(sqrt(sqr(m[i].x - m[j].x) + sqr(m[i].y - m[j].y)))));
        Fi[k].y := {eps *} (m[j].y - m[i].y) * 4 * (12 {* si12} / exp(14 * ln(sqrt(sqr(m[i].x - m[j].x) + sqr(m[i].y - m[j].y)))) - 6 {* si6} / exp(8 * ln(sqrt(sqr(m[i].x - m[j].x) + sqr(m[i].y - m[j].y)))));
        inc(k);
      end;
    end;
    sumfx := 0; sumfy := 0;
    for j := 1 to N - 1 do 
    begin
      sumfx := Fi[j].x + sumfx;
      sumfy := Fi[j].y + sumfy;
    end;
    m[i].ax := sumfx {/ mN2};
    m[i].ay := sumfy {/ mN2};
  end;
  for i := 1 to N do 
  begin//новые скорости n+1
    m[i].vx := m[i].vx + 0.5 * dt * (ai[i].ax + m[i].ax);
    m[i].vy := m[i].vy + 0.5 * dt * (ai[i].ay + m[i].ay);
  end;
end;

var
  ancambl: Tancambl;
  i, iter: longint;
  file1,file2: text;
  x, y: double;

begin
  randomize;
  iter := 1;
  assign(file1, 'C:/Users/јндрей/Desktop/«ј¬»—»ћќ—“№ R');
  assign(file2, 'C:/Users/јндрей/Desktop/«ј¬»—»ћќ—“№ Rv');
  rewrite(file1); rewrite(file2);
  generate(ancambl);
  for i := 1 to 100000 do 
  begin
    x := ancambl[1].x;
    y := ancambl[1].y;
    interaction(ancambl, iter);
    inc(iter);
    writeln(file1, sqrt(sqr(ancambl[1].x - x) + sqr(ancambl[1].y - y)));
    writeln(file2, ancambl[1].vx:20,ancambl[1].vy:20 );
  end;
  close(file1); close(file2);
end.
