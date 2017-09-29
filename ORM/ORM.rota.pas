unit ORM.rota;

interface

uses
  System.Actions, System.UITypes,
  sysutils, ExtCtrls, Controls, Contnrs, Dialogs, db, classes, forms,
  rotina.Registro, uconstantes, rotina.Rotinas, uRichEdit, dialogo.progressbar,
  orm.ItRotaValor, orm.ItRota, orm.TpRota,
  classe.gerar, classe.query, rotina.retornasql, classe.executasql, classe.dao;

Type
  TRota = class(TRegistroQuipos)
  private
    Fcdrepresentante: integer;
    Fcdrota: integer;
    Fcduf: integer;
    Fcdmunicipio: integer;
    Fcdtprota: integer;
    Fnmrota: string;
    Fnmbairro: string;
    Ftprota: TTPRota;
    FItRota: TItRotaList;
    FItRotaValor: TItRotaValorList;
  public
    property tprota : TTPRota read Ftprota write ftprota;
    property ItRota : TItRotaList read FItRota write FItRota;
    property ItRotaValor : TItRotaValorList read FItRotaValor write FItRotaValor;
    [keyfield]
    property cdrota : integer read Fcdrota write fcdrota;
    [fk]
    property cdrepresentante : integer read Fcdrepresentante write fcdrepresentante;
    [fk]
    property cduf : integer read Fcduf write fcduf;
    [fk]
    property cdmunicipio : integer read Fcdmunicipio write fcdmunicipio;
    [fk]
    property cdtprota : integer read Fcdtprota write fcdtprota;
    property nmrota : string read Fnmrota write fnmrota;
    property nmbairro : string read Fnmbairro write fnmbairro;
    constructor create;
    destructor destroy; override;
    function get_vlfretepeso(qtentrega:integer):currency;
    function ImportarCliente:boolean;
  end;

implementation

constructor TRota.create;
begin
  inherited;
  ftprota := ttprota.create;
  fItRota := tItRotaList.create;
  fItRotaValor := tItRotaValorList.create;
end;

destructor TRota.destroy;
begin
  freeandnil(ftprota);
  FreeAndNil(fItRota);
  FreeAndNil(fItRotaValor);
  inherited;
end;

function TRota.get_vlfretepeso(qtentrega: integer): currency;
var
  i : integer;
begin
  result := 0;
  ItRotaValor.Ler(cdrota);
  for i := 0 to ItRotaValor.count -1 do
  begin
    result := itrotavalor.items[i].vlunitario;
    if qtentrega <= itrotavalor.items[i].qtitem then
    begin
      break;
    end;
  end;
end;

function TRota.ImportarCliente: boolean;
var
  erro, arquivo : TStrings;
  filename : string;
  i : integer;
  boadicionar : boolean;
begin
  result := False;
  if not QRotinas.SelecionarNomeArquivo(filename) then
  begin
    exit;
  end;
  boadicionar := false;
  arquivo := TStringList.create;
  erro    := TStringList.create;
  frmprogressbar := tfrmprogressbar.create(nil);
  try
    arquivo.LoadFromFile(filename);
    frmprogressbar.gau.MaxValue := arquivo.Count;
    frmprogressbar.show;
    for i := 0 to arquivo.count - 1 do
    begin
      frmprogressbar.gau.Progress := i + 1;
      application.processmessages;

      if trim(arquivo[i]) = '' then
      begin
        erro.add('linha '+inttostr(i)+' vazia.');
        continue;
      end;
      if itrota.ExisteCliente(strtoint(arquivo[i])) then
      begin
        erro.add('Código do Cliente: '+inttostr(i)+' repetido.');
        continue;
      end;
      if not RegistroExiste(_cliente, _cdcliente+'='+arquivo[i]) then
      begin
        erro.add('Código do cliente: '+arquivo[i]+' inexistente.');
        continue;
      end;
      itrota.Insert(cdrota);
      itrota.items[itrota.count-1].cdcliente := strtoint64(arquivo[i]);
      boadicionar := true;
    end;
    if (erro.count > 0) and (messagedlg('Existem erro. Gostaria de visualizá-los?', mtconfirmation, [mbyes, mbno], 0) = mryes) then
    begin
      ExibirSaidaVideo(erro);
    end;
    if boadicionar and (messagedlg('Inserir os clientes?', mtconfirmation, [mbyes, mbno], 0) = mryes) then
    begin
      erro.text := itrota.sql_insert;
      ExecutaScript(erro);
      result := True;
    end;
  finally
    freeandnil(arquivo);
    freeandnil(erro);
    freeandnil(frmprogressbar);
  end;
end;

end.
