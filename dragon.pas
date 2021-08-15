program Dragon;
uses Graph, Wincrt;

Type Point = record
	x,y : real;
end;

	Procedure DragonKurwa(lineStart, lineEnd:Point; deep:Integer);
	var Apex:Point;


	Begin	
	if deep > 0 then begin

	Apex.x :=(lineEnd.x - lineEnd.y + lineStart.x + lineStart.y)/2;
	Apex.y :=(lineEnd.x + lineEnd.y - lineStart.x + lineStart.y)/2;
	
	DragonKurwa(lineStart,Apex, deep-1);
	DragonKurwa(lineEnd, Apex, deep-1);
	end else begin
	Line(Round(lineStart.x),Round(lineStart.y), Round(lineEnd.x), Round(lineEnd.y));
	
	end;

	End;
	
var Gd, Gm, deep : integer;
var lineStart,lineEnd:Point;

Begin
	randomize;
	Gd := 0;
	deep:=1;
	Repeat
		initgraph(Gd,Gm,'');
		SetColor(Random(15)+1);	
		lineStart.x:=Getmaxx/4;
		lineStart.y:=Getmaxy/3;
		lineEnd.x:=lineStart.x * 3;
		lineEnd.y:=lineStart.y;
		DragonKurwa(lineStart, lineEnd, deep);
		delay(1000);
		inc(deep);
		closegraph;
	Until(deep>20) or (KeyPressed);
	Readln();
End.

