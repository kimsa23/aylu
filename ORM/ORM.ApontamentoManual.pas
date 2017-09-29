unit ORM.ApontamentoManual;

interface

uses
  System.Actions, System.UITypes,
  SysUtils, Controls, Contnrs, Dialogs, DB, Classes,
  orm.ItOrdProducaoRecurso,
  classe.query, rotina.retornasql, classe.dao, orm.apontamento, classe.executasql, orm.empresa,
  uConstantes, rotina.strings, rotina.Registro, orm.STApontamentoManual, orm.TpApontamentoManual;

type
  TApontamentoManual = class(TRegistroQuipos)
  private
    ftpapontamentomanual : TTpApontamentoManual;
    fcdapontamentomanual : Integer;
    fcdtpapontamentomanual : Integer;
    fcdfuncionario : integer;
    fdtemissao : TDate;
    FApontamento: TApontamentoList;
    fcdtpequipamento: integer;
    fdtlancamento: TDate;
    fcdstapontamentomanual: Integer;
    fstapontamentomanual: TstapontamentoManual;
    fdttermino: TDate;
    fhrinicio: TTime;
    fhrtermino: TTime;
    fcdfuncionarioresponsavel: integer;
  public
    property Apontamento : TApontamentoList read FApontamento write FApontamento;
    property tpapontamentomanual : TTpApontamentoManual read ftpapontamentomanual write ftpapontamentomanual;
    property stapontamentomanual : TstapontamentoManual read fstapontamentomanual write fstapontamentomanual;
    [keyfield]
    property cdapontamentomanual : Integer read fcdapontamentomanual write fcdapontamentomanual;
    [fk]
    property cdtpapontamentomanual : Integer read fcdtpapontamentomanual write fcdtpapontamentomanual;
    [fk]
    property cdstapontamentomanual : Integer read fcdstapontamentomanual write fcdstapontamentomanual;
    [fk]
    property cdfuncionario : integer read fcdfuncionario write fcdfuncionario;
    [fk]
    property cdtpequipamento : integer read fcdtpequipamento write fcdtpequipamento;
    [FK]
    property cdfuncionarioresponsavel : integer read fcdfuncionarioresponsavel write fcdfuncionarioresponsavel;
    property dtemissao : TDate read fdtemissao write fdtemissao;
    property dtlancamento : TDate read fdtlancamento write fdtlancamento;
    property hrinicio : TTime read fhrinicio write fhrinicio;
    property dttermino : TDate read fdttermino write fdttermino;
    property hrtermino : TTime read fhrtermino write fhrtermino;
    constructor create;
    destructor destroy; override;
    procedure checkCampoObrigatorio;
    function aplicarCodigoOrdproducao:Boolean;
    function removerCodigoOrdproducao: Boolean;
  end;

implementation

uses orm.ordproducao, rotina.datahora;

function TApontamentoManual.aplicarCodigoOrdproducao: Boolean;
var
  codigo, i : Integer;
  mensagem : string;
begin
  mensagem := '';
  for i := 0 to Apontamento.Count - 1 do
  begin
    if (Apontamento.Items[i].cdordproducao > 0) or (Apontamento.Items[i].nuestrutural = '') then
    begin
      Continue;
    end;
    Apontamento.Items[i].cdordproducao := tordproducao.getCdordproducaoComEstrutura(dtemissao, cdtpequipamento, apontamento.Items[i].cdproduto, apontamento.Items[i].nuestrutural);
    if Apontamento.Items[i].cdordproducao = 0 then
    begin
      Apontamento.Items[i].cdordproducao := tordproducao.getCdordproducaoSemEstrutura(dtemissao, cdtpequipamento, apontamento.Items[i].cdproduto, Apontamento);
    end;
    if Apontamento.Items[i].cdordproducao > 0 then
    begin
      codigo := TItOrdProducaoRecurso.getCditordproducaorecurso(Apontamento.Items[i].cdordproducao, cdtpequipamento);
      if codigo > 0 then
      begin
        Apontamento.Items[i].cditordproducaorecurso := codigo;
        Apontamento.Items[i].hrduracao              := Apontamento.Items[i].hrfim - Apontamento.Items[i].hrinicio;
        Apontamento.Items[i].qtduracao              := get_qtduracao(Apontamento.Items[i].dtemissao+Apontamento.Items[i].hrinicio, Apontamento.Items[i].dtemissao+Apontamento.Items[i].hrfim);
      end;
      Apontamento.Items[i].Update;
    end
    else
    begin
      mensagem := mensagem + Apontamento.Items[i].cddigitado+' - Estrutura '+Apontamento.Items[i].nuestrutural+#13;
    end;
  end;
  if mensagem <> '' then
  begin
    mensagem := 'Produto(s) que não possuem Ordem de Produção disponível:'#13+mensagem+#13;
  end;
  mensagem := mensagem + Apontamento.podeAplicarCodigoOrdproducao;
  if mensagem <> '' then
  begin
    for i := 0 to Apontamento.Count - 1 do
    begin
      Apontamento.Items[i].cdordproducao          := 0;
      apontamento.Items[i].cditordproducaorecurso := 0;
      apontamento.Items[i].Update;
    end;
    ShowMessage('Número(s) Estrutural não pode ser aplicado fora da sequencia:'#13+mensagem);
    result := False;
    Exit;
  end;
  for i := 0 to apontamento.Count - 1 do
  begin
    Apontamento.Items[i].configurarItordproducaorecurso(dtemissao);
    Apontamento.Items[i].configurarOrdproducao;
  end;
  cdstapontamentomanual := 2;
  Update;
  result := True;
end;

procedure TApontamentoManual.checkCampoObrigatorio;
begin
  if dtemissao = 0 then
  begin
    MessageDlg('Data de emissão é um campo obrigatório.', mtInformation, [mbOK], 0);
    Abort;
  end;
  if dtlancamento = 0 then
  begin
    MessageDlg('Data de Lançamento é um campo obrigatório.', mtInformation, [mbOK], 0);
    Abort;
  end;
  if cdtpapontamentomanual = 0 then
  begin
    MessageDlg('Tipo é um campo obrigatório.', mtInformation, [mbOK], 0);
    Abort;
  end;
  if cdfuncionario = 0 then
  begin
    MessageDlg('Funcionário é um campo obrigatório.', mtInformation, [mbOK], 0);
    Abort;
  end;
  if cdtpequipamento = 0 then
  begin
    MessageDlg('Tipo de Equipamento é um campo obrigatório.', mtInformation, [mbOK], 0);
    Abort;
  end;
end;

constructor TApontamentoManual.create;
begin
  inherited create;
  FApontamento := TApontamentoList.Create;
  ftpapontamentomanual := TTpApontamentoManual.create;
  fstapontamentomanual := TstapontamentoManual.create;
end;

destructor TApontamentoManual.destroy;
begin
  FreeAndNil(ftpapontamentomanual);
  FreeAndNil(fstapontamentomanual);
  FreeAndNil(fApontamento);
  inherited;
end;

function TApontamentoManual.removerCodigoOrdproducao: Boolean;
begin
  result := Apontamento.podeRemoverCodigoOrdproducao;
  if not result then
  begin
    Exit;
  end;
  result := Apontamento.removerCodigoOrdproducao;
  if result then
  begin
    cdstapontamentomanual := 1;
    Update;
  end;
end;

end.
