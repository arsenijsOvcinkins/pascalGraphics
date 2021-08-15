program triangle;

Uses WinCrt, Graph, Math;

Procedure SierpinskiTriangle (x1,x2,x3,y1,y2,y3:real);
var xn1,xn2,xn3,yn1,yn2,yn3:real;
Begin
	xn1:=(x1 + x2) / 2;
	xn2:=(x2+x3) / 2;
	xn3:=(x3 + x1) / 2;
	
	yn1:=(y1 + y2) / 2;
	yn2:=(y2 + y3) / 2;
	yn3:=(y3 + y1) / 2;
	
	if (Round(Sqrt(Sqr(x2-x1) + Sqr(y2-y1)))>3) then 
	begin
		Setcolor(Random(5)+1);
		Line (Round(xn1),Round(yn1),Round(xn2),Round(yn2));
		Setcolor(Random(5)+1);
		Line (Round(xn2),Round(yn2),Round(xn3),Round(yn3));
		Setcolor(Random(5)+1);
		Line (Round(xn3),Round(yn3),Round(xn1),Round(yn1));
		
	SierpinskiTriangle(xn1,xn3,x1,yn1,yn3,y1);
	SierpinskiTriangle(xn1, x2, xn2, yn1, y2, yn2);
	SierpinskiTriangle(xn3, xn2, x3, yn3, yn2, y3);
	end;
		
	
End;

var Gd, Gm: integer;

Begin
	randomize;
	Gd := 0;
	initgraph(Gd,Gm,'');
	SetColor(Random(5)+1);
	Line (0,Getmaxy,Getmaxx div 2, 0);
	Setcolor(Random(5)+1);
	Line (Getmaxx div 2,0,Getmaxx,Getmaxy);
	Setcolor(Random(14)+1);
	Line (Getmaxx, Getmaxy, 0, Getmaxy);
	
	SierpinskiTriangle(0,Getmaxx div 2, Getmaxx, Getmaxy, 0, Getmaxy);
	
	Readln();
	
	
End.

