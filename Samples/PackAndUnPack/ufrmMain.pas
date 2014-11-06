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
    procedure btnDeleteClick(Sender: TObject);
    procedure btnTesterClick(Sender: TObject);
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
    lvmsgPack.S['key.obj'] := edtData.Text;


    lvBytes := lvMsgPack.EncodeToBytes;

    lvMsgPack2.DecodeFromBytes(lvBytes);


    mmoOutPut.Lines.Add(lvMsgPack2.S['key.obj']);

  finally
    lvMsgPack2.Free;
    lvMsgPack.Free;
  end;

end;

end.
