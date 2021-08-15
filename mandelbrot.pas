program Mandellbrot;
uses wincrt,graph;
Type Point = Record
   a,b:real;
end;
procedure MandellbrotSet(Z,C:Point;deep:integer);
var
tmp:real;
begin
    if (deep>0) and (sqr(Z.a)+sqr(Z.b)<=4) then begin
        tmp:= (sqr(Z.a)-sqr(Z.b)) + C.a;
        Z.b:= (2*z.a*z.b)+C.b ;
        Z.a:=tmp;

        MandellbrotSet(Z,C,deep-1);
    end else begin
        if (deep=0) then Putpixel(round((2+c.a)*getmaxx/3),round((1+c.b)*getmaxy/2 ),magenta) else Putpixel(round((2+c.a)*getmaxx/3),round((1+c.b)*getmaxy/2 ),black) 
    end;
end;
var
gd,gm,deep:integer;
step,c0,z0:Point;
begin
    gd:=0;
    initgraph(gd,gm,'');
    step.a:=0;
    step.b:=0;
    
    z0.a:=step.a;
    z0.b:=step.b;
    deep:=100;
    repeat
    step.b:=step.b+1;
    c0.b:=step.b*2/getmaxy -1;
        repeat
            step.a:=step.a+1;
            c0.a:=step.a*3/getmaxx -2;
            MandellbrotSet(z0,c0,deep);
        until(c0.a>1);
        step.a:=0;
    until(c0.b>1);
    readln();
    closegraph();
end.
