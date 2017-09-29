unit ORM.Eventoemail;

interface

uses
  System.Actions, System.UITypes, Contnrs, Forms, Dialogs, ComCtrls, sysutils, ExtCtrls,
  Controls, Menus, ActnList, Classes, DB,
  orm.empresa, classe.query, rotina.retornasql, classe.dao, classe.email, orm.usuario, classe.impressaomatricial,
  classe.aplicacao,
  rotina.Registro, rotina.strings, uconstantes;

type
  TEventoEmail = class(TRegistroQuipos)
  private
    Fdsassunto: string;
    Fcdreportuser: integer;
    Fdsdestinatario: string;
    Fdstitulo: string;
    Fnmeventoemail: string;
    Fcdreport: integer;
    Fcdeventoemail: integer;
    Femailcopia: string;
    Fboenviarsilenciosamente: string;
    Fdssql: string;
    Fcdtptemporizador: integer;
    Fboservico: string;
    Fhrevento: TTime;
    function TratarTexto(texto: string; cds:TDataset):string;
    function AssuntoTrocadoPorCampo(texto:string; field: TField): string; overload;
    function ExisteCampoAssunto(texto, nmfield: string): Boolean;
  public
    [keyfield]
    property cdeventoemail : integer read Fcdeventoemail write Fcdeventoemail;
    [fk]
    property cdreportuser : integer read Fcdreportuser write Fcdreportuser;
    [fk]
    property cdreport : integer read Fcdreport write Fcdreport;
    [fk]
    property cdtptemporizador : integer read Fcdtptemporizador write Fcdtptemporizador;
    property nmeventoemail : string read Fnmeventoemail write Fnmeventoemail;
    property emailcopia : string read Femailcopia write Femailcopia;
    property dstitulo : string read Fdstitulo write Fdstitulo;
    property dsassunto : string read Fdsassunto write Fdsassunto;
    property dsdestinatario : string read Fdsdestinatario write Fdsdestinatario;
    property dssql : string read Fdssql write Fdssql;
    property boenviarsilenciosamente : string read Fboenviarsilenciosamente write Fboenviarsilenciosamente;
    property boservico : string read Fboservico write Fboservico;
    property hrevento : TTime read Fhrevento write Fhrevento;
    function TratarAssunto(cds:TDataset):string;
    function TratarTitulo (cds:TDataset):string;
    function getemail(tabela, codigo:string):string;
    function TratarEmail(codigo:integer):string;
  end;
  TEventoEmailList = class(TObjectList)
  private
    function GetItem(Index: Integer): TEventoEmail;
    procedure SetItem(Index: Integer; const Value: TEventoEmail);
  public
    function New: TEventoEmail;
    property Items[Index: Integer]: TEventoEmail read GetItem write SetItem;
    function Ler(nmcdfield: string; codigo:Integer):Boolean;overload;
    function Ler(sqlwhere: string):Boolean;overload;
  end;

implementation

function TEventoEmail.getemail(tabela, codigo: string): string;
begin
  result := NomedoCodigo(tabela, codigo, _email);
end;

function TEventoEmail.TratarAssunto(cds: TDataset): string;
begin
  result := TratarTexto(dsassunto, cds);
end;

function TEventoEmail.TratarEmail(codigo: integer): string;
var
  impressao : TImpressaoMatricial;
begin
  impressao := timpressaomatricial.create;
  try
    result := impressao.imprimir(aplicacao.confire, dssql, false);
  finally
    freeandnil(impressao);
  end;
end;

function TEventoEmail.AssuntoTrocadoPorCampo(texto:string; field: TField):string;
var
  i : Integer;
begin
  result := texto;
  while Pos('<'+field.FieldName+'>', UpperCase(texto)) > 0 do
  begin
    i := Pos('<'+field.FieldName+'>', UpperCase(texto));
    if i = 0 then
    begin
      i := Pos('<'+field.FieldName+'>', UpperCase(texto));
    end;
    system.Delete(result, i, Length(field.FieldName)+2);
    if (field.DataType = ftBcd) or (field.DataType = ftCurrency) then
    begin
      system.Insert(getmoeda(field.AsCurrency), Result, i);
    end
    else
    begin
      system.Insert(field.asstring, Result, i);
    end;
    texto := result;
  end;
end;

function TEventoEmail.ExisteCampoAssunto(texto:string; nmfield:string):Boolean;
begin
  result := Pos('<'+nmfield+'>', UpperCase(texto)) > 0;
end;

function TEventoEmail.TratarTexto(texto:string; cds: TDataset): string;
var
  i : Integer;
begin
  for i := 0 to cds.FieldCount - 1 do
  begin
    if ExisteCampoAssunto(texto, cds.Fields[i].FieldName) then
    begin
      texto := AssuntoTrocadoPorCampo(texto, cds.Fields[i]);
    end;
  end;
  result := texto;
end;

function TEventoEmail.TratarTitulo(cds: TDataset): string;
begin
  result := TratarTexto(dstitulo, cds);
end;

function TEventoEmailList.GetItem(Index: Integer): TEventoEmail;
begin
  Result := TEventoEmail(Inherited Items[Index]);
end;

function TEventoEmailList.Ler(sqlwhere: string): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_where(_eventoemail, sqlwhere));
  try
    clear;
    result := q.q.RecordCount > 0;
    if not result then
    begin
      Exit;
    end;
    while not q.q.Eof do
    begin
      New.Select(q.q);
      q.q.Next;
    end;
  finally
    FreeAndNil(q);
  end;
end;

function TEventoEmailList.Ler(nmcdfield: string; codigo: Integer): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_eventoemail, codigo, nmcdfield));
  try
    clear;
    result := q.q.RecordCount > 0;
    if not result then
    begin
      Exit;
    end;
    while not q.q.Eof do
    begin
      New.Select(q.q.fieldbyname(_cdeventoemail).AsInteger);
      q.q.Next;
    end;
  finally
    FreeAndNil(q);
  end;
end;

function TEventoEmailList.New: TEventoEmail;
begin
  Result := TEventoEmail.Create;
  Add(Result);
end;

procedure TEventoEmailList.SetItem(Index: Integer; const Value: TEventoEmail);
begin
  Put(Index, Value);
end;

end.
