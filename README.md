# Msgpack for Delphi

It's like JSON but small and fast.

thanks qmsgpack author - swish

Works with
--------

* Delphi 2007 (tested)
* XE5, XE7 (tested)

  
### Code Example
```Pascal

var
  lvMsg, lvMsg2:TSimpleMsgPack;
  lvBytes:TBytes;
  s:string;
begin
  lvMsg := TSimpleMsgPack.Create;
  lvMsg.S['key.obj'] := '汉字,ascii';
  if dlgOpen.Execute then
  begin
    lvMsg.S['key.image.name'] := ExtractFileName(dlgOpen.FileName);
    
    // file binary data
    lvMsg.ForcePathObject('key.image.data').LoadBinaryFromFile(dlgOpen.FileName);
  end;
  
  //
  lvBytes := lvMsg.EncodeToBytes;

  lvMsg2 := TSimpleMsgPack.Create;
  lvMsg2.DecodeFromBytes(lvBytes);
  //
  Memo1.Lines.Add(lvMsg2.S['key.obj']);
  if lvMsg2.S['key.image.name'] <> '' then
  begin
    s := ExtractFilePath(ParamStr(0)) + lvMsg2.S['key.image.name'];
    Memo1.Lines.Add('file saved');
    Memo1.Lines.Add(s);
    lvMsg2.ForcePathObject('key.image.data').SaveBinaryToFile(s);    
  end;
  
  ```
