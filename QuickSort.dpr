// ------------------------------------------------------------
// Implement quick sort from Algorithms and Data Structures
// by Niklaus Wirth.
//
// Use the array as presented in the book and run the algorithm as
// a console application project type.
//
// Jan 3, 2026
// ------------------------------------------------------------
program QuickSort;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

var
  Numbers : array[0..7] of Integer = (44,55,12,42,94,06,18,67);

procedure printArray(const arr: array of Integer);
var i: Integer;
begin
  for i := Low(arr) to High(arr) do
     Write(arr[i], ', ');
  Writeln;
end;

procedure sort( L, R : Integer; var arr: array of Integer);
var
  i, j: Integer;
  x, w: Integer;
begin
  Writeln('sort L=', L, ' R=', R);
  i := L;
  j := R;
  x := arr[(L+R) div 2];
  repeat
    while arr[i] < x do
    begin
      i := (i+1);
    end;
    while x < arr[j] do
    begin
      j := (j-1);
    end;
    if i <= j then
    begin
      w := arr[i];
      Writeln('Swap ',w);
      arr[i] := arr[j];
      arr[j] := w;
      i := i + 1;
      j := j - 1;
    end;
    Writeln('i = ',i);
    Writeln('j = ',j);
  until i > j;

  printArray(arr);

  if L < j then
  begin
    sort(L,j,arr);
  end;
  if i < R then
  begin
    sort(i,R,arr);
  end;

end;


begin
  try
    Writeln('Running Quicksort...');
    printArray(Numbers);
    sort(0,High(Numbers),Numbers);
    readln;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
