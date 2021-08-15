program lightningStrike;

uses graph,wincrt;

Procedure drawLightning(x,y:real;deep :integer);
var randomRes, N, R : real;
Begin
	randomRes:=	Random(30)+deep*0.7;
	if( (x < Getmaxx) AND(x > 0) AND( y < Getmaxy)) then begin
		if ((randomRes >=17) and (randomRes<30)) then begin
			N:=Random(20)+20;
			inc (deep);
			Line(Round(x),Round(y),Round(x),Round(y+ N));
			drawLightning(x, y + N,deep);
		end else if ((randomRes >= 0) and( randomRes <17)) then begin
			N:=Random(25)+20;
			R:=Random(25)+20;
			inc (deep);
			Line(Round(x),Round(y),Round(x+R),Round(y+N));
			drawLightning(x + R, y + N, deep);
					
			N:=Random(25)+20;
			R:=Random(25)+20;
			inc (deep);
			Line(Round(x),Round(y),Round(x-R),Round(y+N) );
			drawLightning(x-R, y + N,deep);
					end;
			end;

End;
	var Gd, Gm,deep: integer;
Begin
	randomize;
	deep:=1;
	Gd := 0;
	Repeat
	initgraph(Gd,Gm,'');
	SetColor(green);
	drawLightning(Getmaxx / 2, 0, deep);
	delay(1000);
	closegraph;
	
	Until(KeyPressed);
	Readln();
End.
