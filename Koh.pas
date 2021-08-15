program Koh; 
uses wincrt, graph, math; 
procedure kohStar (x1, y1, x2, y2:real); 

var  xstart, ystart, xfin, yfin, xApex, yApex : real; 

Begin 
 

	if (Sqrt((x1-x2)*(x1-x2) + (y1-y2)*(y1-y2))>3) then begin  

	xstart := (x2-x1)/3 + x1; 
	xfin :=(x2-x1)/3*2 + x1; 

	ystart := (y2-y1)/3 + y1; 
	yfin :=((y2-y1)/3)*2 + y1; 

	xApex := (xfin-xstart)*cos(60*pi/180) - (yfin-ystart)*sin(60*pi/180)+xstart; 
	yApex := (yfin-ystart)*cos(60*pi/180) + (xfin-xstart)*sin(60*pi/180)+ystart;
	
	kohStar(x1, y1, xstart, ystart);
	kohStar(xstart, ystart, xApex, yApex);
	kohStar(xApex, yApex, xfin, yfin);
	kohStar(xfin, yfin, x2, y2);
	end else begin
		SetColor(Green);
		Line(Round(x1), Round(y1), Round(x2), Round(y2));
	end;
End;

var Gd, Gm: integer;
var	 x1,x2,x3,y1,y2,y3:real;
Begin
	Gd := 0;
	initgraph(Gd,Gm,'');
	Bar(0,0,Getmaxx, Getmaxy);
	
	x1:=Getmaxx / 3;
	y1:=Getmaxy / 4*3;
	x2:=Getmaxx - Getmaxx / 3;
	y2:=y1;
	x3:=(x2-x1)*cos(-60*pi/180) - (y2-y1)*sin(-60*pi/180)+x1;
	y3:=(y2-y1)*cos(-60*pi/180) + (x2-x1)*sin(-60*pi/180)+y1;
	kohStar(x1,y1,x2,y2);
	kohStar(x3,y3,x1,y1);
	kohStar(x2,y2,x3,y3);

	Readln();
End.
