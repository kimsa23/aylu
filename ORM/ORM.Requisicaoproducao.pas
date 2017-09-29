unit ORM.Requisicaoproducao;

interface

uses
  Contnrs, Forms, Classes, sysutils, ExtCtrls, Controls,
  uconstantes, rotina.datahora, rotina.strings, rotina.Registro, dialogo.progressbar,
  orm.tpordproducao, orm.ordproducao, classe.query, classe.aplicacao, orm.empresa,
  orm.STRequisicaoProducao, orm.ItRequisicaoProducao, classe.registrainformacao,
  orm.produto, orm.TPRequisicaoProducao,
  classe.gerar, classe.executasql, rotina.retornasql, classe.dao;

Type
  TRequisicaoProducao = class(TRegistroQuipos)
  private
    Fqtproducao: Double;
    Fqtitem: Double;
    Fcdstrequisicaoproducao: Integer;
    Fcdtprequisicaoproducao: Integer;
    Fcdfuncionariosolicitante: Integer;
    Fcdrequisicaoproducao: Integer;
    Fcdfuncionario: Integer;
    Fdsjustificativa: string;
    Fdsobservacao: string;
    Fdtemissao: TDate;
    Fdtprventrega: TDate;
    Fdtprevisao: TDate;
    Ftprequisicaoproducao: TTPRequisicaoProducao;
    Fstrequisicaoproducao: TSTRequisicaoProducao;
    FItrequisicaoproducao: TItrequisicaoproducaoList;
  public
    property Itrequisicaoproducao : TItrequisicaoproducaoList read FItrequisicaoproducao write FItrequisicaoproducao;
    property strequisicaoproducao : TSTRequisicaoProducao read Fstrequisicaoproducao write Fstrequisicaoproducao;
    property tprequisicaoproducao : TTPRequisicaoProducao read Ftprequisicaoproducao write Ftprequisicaoproducao;
    [keyfield]
    property cdrequisicaoproducao : Integer read Fcdrequisicaoproducao write Fcdrequisicaoproducao;
    [fk]
    property cdfuncionario : Integer read Fcdfuncionario write Fcdfuncionario;
    [fk]
    property cdstrequisicaoproducao : Integer read Fcdstrequisicaoproducao write Fcdstrequisicaoproducao;
    [fk]
    property cdtprequisicaoproducao : Integer read Fcdtprequisicaoproducao write Fcdtprequisicaoproducao;
    [fk]
    property cdfuncionariosolicitante : Integer read Fcdfuncionariosolicitante write Fcdfuncionariosolicitante;
    property dsobservacao : string read Fdsobservacao write Fdsobservacao;
    property dtemissao : TDate read Fdtemissao write Fdtemissao;
    property dtprventrega : TDate read Fdtprventrega write Fdtprventrega;
    property qtitem : Double read Fqtitem write Fqtitem;
    property qtproducao : Double read Fqtproducao write Fqtproducao;
    property dtprevisao : TDate read Fdtprevisao write Fdtprevisao;
    property dsjustificativa : string read Fdsjustificativa write Fdsjustificativa;
    constructor create;
    destructor destroy; override;
    function Copiar:Integer;
  end;

implementation

uses orm.Formulacao, orm.usuario;

function TRequisicaoProducao.Copiar: Integer;
var
  requisicao : TRequisicaoProducao;
  I: Integer;
begin
  requisicao := TRequisicaoProducao.create;
  try
    requisicao.CopiarObjeto(self);
    requisicao.cdrequisicaoproducao     := QGerar.GerarCodigo(_requisicaoproducao);
    if usuario.funcionario.cdfuncionario > 0 then
    begin
      requisicao.cdfuncionariosolicitante := usuario.funcionario.cdfuncionario;
    end;
    requisicao.dtemissao    := Date;
    requisicao.dtprventrega := Date;
    requisicao.qtproducao   := 0;
    requisicao.Insert;
    for I := 0 to Itrequisicaoproducao.Count - 1 do
    begin
      requisicao.Itrequisicaoproducao.New;
      requisicao.Itrequisicaoproducao.Items[i].CopiarObjeto(Itrequisicaoproducao.Items[i]);
      requisicao.Itrequisicaoproducao.Items[i].cdrequisicaoproducao   := requisicao.cdrequisicaoproducao;
      requisicao.Itrequisicaoproducao.Items[i].cditrequisicaoproducao := QGerar.GerarCodigo(_itrequisicaoproducao);
      requisicao.Itrequisicaoproducao.Items[i].qtproducao := 0;
      requisicao.Itrequisicaoproducao.Items[i].Insert;
    end;
    result := requisicao.cdrequisicaoproducao;
  finally
    FreeAndNil(requisicao);
  end;
end;

constructor TRequisicaoProducao.create;
begin
  inherited;
  FItrequisicaoproducao := TItrequisicaoproducaoList.Create;
  Ftprequisicaoproducao := ttprequisicaoproducao.create;
  Fstrequisicaoproducao := tstrequisicaoproducao.create;
end;

destructor TRequisicaoProducao.destroy;
begin
  FreeAndNil(ftprequisicaoproducao);
  FreeAndNil(fstrequisicaoproducao);
  FreeAndNil(fitrequisicaoproducao);
  inherited;
end;

end.
