unit ufrmMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, SimpleMsgPack;

type
  TForm2 = class(TForm)
    btnTester: TButton;
    edtData: TEdit;
    mmoOutPut: TMemo;
    btnDelete: TButton;
    Button1: TButton;
    Button2: TButton;
    procedure btnDeleteClick(Sender: TObject);
    procedure btnTesterClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.btnDeleteClick(Sender: TObject);
var
  lvmsgPack,lvMsgPack2, lvTempPack:TSimpleMsgPack;
  lvBytes:TBytes;
begin
  lvmsgPack := TSimpleMsgPack.Create;
  lvMsgPack2 := TSimpleMsgPack.Create;
  try
    lvmsgPack.S['key.obj.name'] := edtData.Text;
    lvmsgPack.DeleteObject('key.obj.name');


    lvBytes := lvMsgPack.EncodeToBytes;

    lvMsgPack2.DecodeFromBytes(lvBytes);


    mmoOutPut.Lines.Add(lvMsgPack2.S['key']);

  finally
    lvMsgPack2.Free;
    lvMsgPack.Free;
  end;
end;

procedure TForm2.btnTesterClick(Sender: TObject);
var
  lvmsgPack,lvMsgPack2, lvTempPack:TSimpleMsgPack;
  lvBytes:TBytes;
begin
  lvmsgPack := TSimpleMsgPack.Create;
  lvMsgPack2 := TSimpleMsgPack.Create;
  try
    lvmsgPack.I['int'] := High(Integer);
    lvmsgPack.I['Cardinal'] := High(Cardinal);
    lvmsgPack.I['Int64'] := High(Int64);
    //lvmsgPack.I['start'] := lvmsgPack.I['start'] + 600;

    lvBytes := lvMsgPack.EncodeToBytes;

    lvMsgPack2.clear;
    lvMsgPack2.DecodeFromBytes(lvBytes);


    mmoOutPut.Lines.Add(lvMsgPack2.S['key.obj']);
    mmoOutPut.Lines.Add(IntToStr(lvMsgPack2.I['int']));
    mmoOutPut.Lines.Add(IntToStr(lvMsgPack2.I['Cardinal']));
    mmoOutPut.Lines.Add(IntToStr(lvMsgPack2.I['Int64']));

  finally
    lvMsgPack2.Free;
    lvMsgPack.Free;
  end;

end;

procedure TForm2.Button1Click(Sender: TObject);
var
  lvStream:TMemoryStream;
  lvmsgPack :TSimpleMsgPack;
begin
  lvStream := TMemoryStream.Create;
  lvStream.LoadFromFile('C:\msgpack.dat');
  lvmsgPack := TSimpleMsgPack.Create;
  lvStream.Position := 0;
  lvmsgPack.DecodeFromStream(lvStream);

  mmoOutPut.Lines.Add(IntToStr(lvmsgPack.I['start']));

end;

procedure TForm2.Button2Click(Sender: TObject);
var
  lvmsgPack,lvMsgPack2, lvTempPack:TSimpleMsgPack;
  lvBytes:TBytes;
begin
  lvmsgPack := TSimpleMsgPack.Create;
  lvMsgPack2 := TSimpleMsgPack.Create;
  try
    lvmsgPack.AsVariant := null;

    lvBytes := lvMsgPack.EncodeToBytes;

  finally
    lvMsgPack2.Free;
    lvMsgPack.Free;
  end;

end;

end.
