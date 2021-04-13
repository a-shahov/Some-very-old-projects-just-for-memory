type
  particle = record
    vx: real;
    vy: real;
  end;

const
  NN   = 20000;
  M    = 0.004;  //молярная масса
  Rg   = 8.314;  //газовая постоянная
  a    = -16000;  //нижняя граница D 
  b    = 16000;   //верхняя граница D
  Ti   = 320;    //температура

var
  ansambl      : array[1..NN] of particle;
  file1        : text;
  i, j, N, k   : longint;
  sum, Fmax    : real;
  r, f         : real; //независимые случайные величины
  Te, v, sumT  : real;

begin
  randomize;
  assign(file1, 'C:/Users/Андрей/Desktop/ЗАВИСИМОСТЬ T');
  rewrite(file1);
  N := 50;
  Fmax := sqrt(M / (2 * pi * Rg * Ti));
  for j := 1 to 350 do 
  begin
    sumT := 0;
    for k := 1 to 45 do 
    begin
      for i := 1 to N do 
      begin
        repeat
          r := random; 
          f := random;
          v := a + (b - a) * r; 
        until (Fmax * f) <= (Fmax * exp(-M * sqr(v) / (2 * rg * Ti)));
        ansambl[i].vx := v;
        repeat
          r := random; 
          f := random;
          v := a + (b - a) * r; 
        until (Fmax * f) <= (Fmax * exp(-M * sqr(v) / (2 * rg * Ti)));
        ansambl[i].vy := v;
      end;
      sum := 0;
      for i := 1 to N do 
        sum := sum + sqr(ansambl[i].vx) + sqr(ansambl[i].vy);
      Te := M / (2 * N * Rg) * sum;
      sumt := sumt + abs(Te - Ti);
    end;
    writeln(file1, sumt / 45 );
    if N <= 200 then N := N + 5
    else N := N + 50;   
  end;
  close(file1);
end.