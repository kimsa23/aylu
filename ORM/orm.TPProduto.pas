unit orm.TPProduto;

interface

uses
  uConstantes,
 Classe.DAO;

type
  TTPProduto = class(TRegistroQuipos)
  private
    fcdtpproduto : integer;
    fnmtpproduto : string;
    fbounidade2 : string;
    fboimovel : string;
    fbocodigofornecedor : string;
    fboproducao : string;
    fboservico : string;
    fbotributacao : string;
    fboarquivo : string;
    fbovalor : string;
    fbocritico : string;
    fboestoque : string;
    fbofornecedorexclusivo : string;
    fbocaracteristicas : string;
    fbodimensional : string;
    fbogerarnomeautomatico : string;
    fbometodoprocesso : string;
    fbotpcliente : string;
    fbodiasgarantia : string;
    fbolocalizacao : string;
    fbocomposto : string;
    fbolote : string;
    fboloteimei : string;
    fbocontabilidade : string;
    fbocombustivel : string;
    fbogradevalor : string;
    fboacabado : string;
    fbomultiplo : string;
    fbocomissao : string;
    fbost : string;
    fbobaixasubprodutovenda : string;
    fboprodutoacabado : string;
    fbobaixaxsubprodutoproducao : string;
    fbocustomediosubproduto: string;
    Fbocomposicaoquimica: string;
    Fbopropriedadefisica: string;
    Fboembalagemtpequipamento: string;
    Fboembalagemformulacao: string;
    Fbometodoprocessoembalagem: string;
    fbometodoprocessotpduracao: string;
    fborecursoformulacao: string;
    fbometodoprocessopreparacao: string;
    fbometodoprocessoformulacao : string;
    fbometodoprocessoquociente : string;
    fbometodoprocessotpequipamento : string;
    fbometodoprocessonuclfiscal : string;
    fbometodoprocessoposicao : string;
    fbometodoprocessoqtpeca : string;
    fbometodoprocessopsunitario : string;
    fbometodoprocessomedida : string;
    fbometodoprocessoicms : string;
    fbometodoprocessofaixa : string;
    fbometodoprocessoipi : string;
    fbometodoprocessopis : string;
    fbometodoprocessocofins : string;
  public
    [keyfield]
    property cdtpproduto : integer read fcdtpproduto write fcdtpproduto;
    property nmtpproduto : string read fnmtpproduto write fnmtpproduto;
    property bocomposicaoquimica : string read Fbocomposicaoquimica write Fbocomposicaoquimica;
    property bopropriedadefisica : string read Fbopropriedadefisica write Fbopropriedadefisica;
    property bounidade2 : string read fbounidade2 write fbounidade2;
    property boimovel : string read fboimovel write fboimovel;
    property bocodigofornecedor : string read fbocodigofornecedor write fbocodigofornecedor;
    property boproducao : string read fboproducao write fboproducao;
    property boservico : string read fboservico write fboservico;
    property botributacao : string read fbotributacao write fbotributacao;
    property boarquivo : string read fboarquivo write fboarquivo;
    property bovalor : string read fbovalor write fbovalor;
    property bocritico : string read fbocritico write fbocritico;
    property boestoque : string read fboestoque write fboestoque;
    property bofornecedorexclusivo : string read fbofornecedorexclusivo write fbofornecedorexclusivo;
    property bocaracteristicas : string read fbocaracteristicas write fbocaracteristicas;
    property bodimensional : string read fbodimensional write fbodimensional;
    property bogerarnomeautomatico : string read fbogerarnomeautomatico write fbogerarnomeautomatico;
    property bometodoprocesso : string read fbometodoprocesso write fbometodoprocesso;
    property botpcliente : string read fbotpcliente write fbotpcliente;
    property bodiasgarantia : string read fbodiasgarantia write fbodiasgarantia;
    property bolocalizacao : string read fbolocalizacao write fbolocalizacao;
    property bocomposto : string read fbocomposto write fbocomposto;
    property bolote : string read fbolote write fbolote;
    property boloteimei : string read fboloteimei write fboloteimei;
    property bocontabilidade : string read fbocontabilidade write fbocontabilidade;
    property bocombustivel : string read fbocombustivel write fbocombustivel;
    property bogradevalor : string read fbogradevalor write fbogradevalor;
    property boacabado : string read fboacabado write fboacabado;
    property bomultiplo : string read fbomultiplo write fbomultiplo;
    property bocomissao : string read fbocomissao write fbocomissao;
    property bost : string read fbost write fbost;
    property bobaixasubprodutovenda : string read fbobaixasubprodutovenda write fbobaixasubprodutovenda;
    property boprodutoacabado : string read fboprodutoacabado write fboprodutoacabado;
    property bobaixaxsubprodutoproducao : string read fbobaixaxsubprodutoproducao write fbobaixaxsubprodutoproducao;
    property bocustomediosubproduto: string read fbocustomediosubproduto write fbocustomediosubproduto;
    property bometodoprocessoembalagem: string read Fbometodoprocessoembalagem write Fbometodoprocessoembalagem;
    property boembalagemformulacao: string read Fboembalagemformulacao write Fboembalagemformulacao;
    property boembalagemtpequipamento: string read Fboembalagemtpequipamento write Fboembalagemtpequipamento;
    property bometodoprocessotpduracao: string read fbometodoprocessotpduracao write fbometodoprocessotpduracao;
    property borecursoformulacao: string read fborecursoformulacao write fborecursoformulacao;
    property bometodoprocessopreparacao: string read fbometodoprocessopreparacao write fbometodoprocessopreparacao;
    property bometodoprocessoformulacao : string read fbometodoprocessoformulacao write fbometodoprocessoformulacao;
    property bometodoprocessoquociente : string read fbometodoprocessoquociente write fbometodoprocessoquociente;
    property bometodoprocessotpequipamento : string read fbometodoprocessotpequipamento write fbometodoprocessotpequipamento;
    property bometodoprocessonuclfiscal : string read fbometodoprocessonuclfiscal write fbometodoprocessonuclfiscal;
    property bometodoprocessoposicao : string read fbometodoprocessoposicao write fbometodoprocessoposicao;
    property bometodoprocessoqtpeca : string read fbometodoprocessoqtpeca write fbometodoprocessoqtpeca;
    property bometodoprocessopsunitario : string read fbometodoprocessopsunitario write fbometodoprocessopsunitario;
    property bometodoprocessomedida : string read fbometodoprocessomedida write fbometodoprocessomedida;
    property bometodoprocessoicms : string read fbometodoprocessoicms write fbometodoprocessoicms;
    property bometodoprocessofaixa : string read fbometodoprocessofaixa write fbometodoprocessofaixa;
    property bometodoprocessoipi : string read fbometodoprocessoipi write fbometodoprocessoipi;
    property bometodoprocessopis : string read fbometodoprocessopis write fbometodoprocessopis;
    property bometodoprocessocofins : string read fbometodoprocessocofins write fbometodoprocessocofins;
    function get_widthunidade2: Integer;
  end;

implementation

function TTPProduto.get_widthunidade2:Integer;
begin
  result := 318;
  if bounidade2 = _s then
  begin
    result := 80;
  end;
end;

end.
