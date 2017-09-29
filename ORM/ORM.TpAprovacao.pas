unit ORM.TpAprovacao;

interface

uses
  System.Actions, System.UITypes, System.Classes,
  SysUtils, controls, Contnrs, db,
  orm.TpAprovacaoGrupos, classe.query, rotina.retornasql, orm.TpAprovacaoUsuarios, orm.grupos, classe.dao,
  uConstantes;

type
  TTpAprovacao = class(TRegistroQuipos)
  private
    Fcdtpprocessointerno: Integer;
    Fcdtpaprovacao: Integer;
    Fnmtpaprovacao: string;
    Ftpaprovacaogrupos: ttpaprovacaogruposlist;
    Ftpaprovacaousuarios: ttpaprovacaousuariosList;
  public
    property tpaprovacaogrupos : ttpaprovacaogruposlist read Ftpaprovacaogrupos write Ftpaprovacaogrupos;
    property tpaprovacaousuarios : ttpaprovacaousuariosList read Ftpaprovacaousuarios write Ftpaprovacaousuarios;
    [keyfield]
    property cdtpaprovacao : Integer read Fcdtpaprovacao write Fcdtpaprovacao;
    [fk]
    property cdtpprocessointerno : Integer read Fcdtpprocessointerno write Fcdtpprocessointerno;
    property nmtpaprovacao : string read Fnmtpaprovacao write Fnmtpaprovacao;
    constructor create;
    destructor destroy; override;
    class function UsuarioPodeAprovar(cdtpprocessointerno_, cdusuario:integer):boolean;
  end;
  TTpaprovacaoList = class(TObjectList)
  private
    function  GetItem(Index: Integer): TTpaprovacao;
    procedure SetItem(Index: Integer; const Value: TTpaprovacao);
  public
    function New: Ttpaprovacao;
    property Items[Index: Integer]: TTpaprovacao read GetItem write SetItem;
    function Ler(nmcdfield: string; codigo:Integer; boclear:Boolean=true):Boolean;overload;
    function Existe_inteiro(nmfield: string; codigo:integer):Boolean;
  end;

implementation

uses orm.usuario;

constructor TTpAprovacao.create;
begin
  inherited;
  ftpaprovacaogrupos := ttpaprovacaogruposlist.Create;
  ftpaprovacaousuarios := ttpaprovacaousuariosList.Create;
end;

destructor TTpAprovacao.destroy;
begin
  freeandnil(ftpaprovacaogrupos);
  freeandnil(ftpaprovacaousuarios);
  inherited;
end;

class function TTpAprovacao.UsuarioPodeAprovar(cdtpprocessointerno_, cdusuario: integer): boolean;
var
  tpaprovacaoList : ttpaprovacaolist;
  i : integer;
  usuario : tusuario;
begin
  result := false;
  tpaprovacaolist := ttpaprovacaolist.Create;
  usuario := tusuario.create;
  try
    usuario.Select(cdusuario);
    tpaprovacaolist.Ler(_cdtpprocessointerno, cdtpprocessointerno_);
    for I := 0 to tpaprovacaolist.Count - 1 do
    begin
      tpaprovacaolist.items[i].tpaprovacaousuarios.Ler(tpaprovacaolist.items[i].cdtpaprovacao);
      result := tpaprovacaolist.items[i].tpaprovacaousuarios.usuarioNaLista(cdusuario);
      if not result then
      begin
        tpaprovacaolist.Items[i].tpaprovacaogrupos.Ler(tpaprovacaolist.Items[i].cdtpaprovacao);
        result := tpaprovacaolist.items[i].tpaprovacaoGrupos.GruposNaLista(usuario.grupos);
      end;
      if result then
      begin
        break;
      end;
    end;
  finally
    freeandnil(tpaprovacaolist);
  end;
end;

function TTpaprovacaoList.Existe_inteiro(nmfield: string; codigo: integer): Boolean;
var
  i : Integer;
begin
  result := False;
  for i := 0 to count-1 do
  begin
    if (nmfield = _cdtpaprovacao) and (codigo = Items[i].cdtpaprovacao) then
    begin
      result := True;
      Break;
    end;
    if (nmfield = _cdtpprocessointerno) and (codigo = Items[i].cdtpprocessointerno) then
    begin
      result := True;
      Break;
    end;
  end;
end;

function TTpaprovacaoList.GetItem(Index: Integer): TTpaprovacao;
begin
  Result := TTpaprovacao(Inherited Items[Index]);
end;

function TTpaprovacaoList.Ler(nmcdfield: string; codigo: Integer; boclear:Boolean=true): Boolean;
  function get_tabela:string;
  begin
    result := _tpaprovacaousuarios;
    if nmcdfield = _cdgrupos then
    begin
      result := _tpaprovacaogrupos;
    end;
    if nmcdfield = _cdtpprocessointerno then
    begin
      result := _tpaprovacao;
    end;
  end;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_field_from_field(get_tabela, _cdtpaprovacao, codigo, nmcdfield));
  try
    if boclear then
    begin
      clear;
    end;
    result := q.q.RecordCount > 0;
    if not result then
    begin
      Exit;
    end;
    while not q.q.Eof do
    begin
      if not Existe_inteiro(_cdtpaprovacao, q.q.fieldbyname(_cdTpaprovacao).AsInteger) then
      begin
        new.Select(q.q);
      end;
      q.q.Next;
    end;
  finally
    FreeAndNil(q);
  end;
end;

function TTpaprovacaoList.New: Ttpaprovacao;
begin
  Result := Ttpaprovacao.Create;
  Add(Result);
end;

procedure TTpaprovacaoList.SetItem(Index: Integer; const Value: TTpaprovacao);
begin
  Put(Index, Value);
end;

end.
