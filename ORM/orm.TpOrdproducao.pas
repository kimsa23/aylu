unit orm.TpOrdproducao;

interface

uses System.Classes,
  Rotina.Retornasql,
  ORM.Empresa,
  Classe.DAO;

type
  TTpOrdproducao = class(TRegistroQuipos)
  private
    fcdfuncionarioresponsavel : integer;
    fbogerarcorte: String;
    fcdprodutocorte : integer;
    fcdstordproducaoeventoemail : integer;
    fcdeventoemailstordproducao : integer;
    fcdstordproducaomapaproducao : integer;
    fcdstordproducaogerarestoque : integer;
    fboformpesagem : String;
    fbotag : String;
    fboentrada : String;
    fboformulacao : String;
    fboqtpeca : String;
    fboproduto : String;
    fboprodutobuscarestoque : String;
    fboconsulta : String;
    fbocusto : String;
    fbopedido : String;
    fbotpequipamento : String;
    fboarquivo : String;
    fbodsdesenho : String;
    fbonuestrutural : String;
    fbodtentrega : String;
    fbodtprevisao : String;
    fbohistoricostatusmanual : String;
    fbomaterial : String;
    fbomaterialbaixarestoque : String;
    fbomaterialfaixa : String;
    fbomaterialnumistura : String;
    fbomaterialicms : String;
    fbomaterialobservacao : String;
    fbomaterialprevisao : String;
    fbomaterialipi : String;
    fbomaterialqtitem : String;
    fbomaterialcofins : String;
    fbomaterialpis : String;
    fbomaterialfrete : String;
    fbomaterialnuclfiscal : String;
    fbomaterialmedida : String;
    fbomaterialpsunitario : String;
    fbomaterialqtconsumo : String;
    fbomaterialqtconsumodigitar : String;
    fbomaterialposicao : String;
    fbomaterialqtestoque : String;
    fbomaterialqtpeca : String;
    fbomaterialvalor : String;
    fbomaterialformulacao : String;
    fbomaterialbag : String;
    fbomateriallote : String;
    fbomaterialvlfinal : String;
    fbogerarrim: String;
    fbogerarcotacao: String;
    fbotpduracao : String;
    fbopreparacao : String;
    fborecurso : String;
    fborecursoformulacao : String;
    fborecursoterminoprevista : String;
    fborecursoliberacao : String;
    fborecursoinicio : String;
    fboprodutoacabado : String;
    fboprodutoqtproducao : String;
    fboprodutosimilarmateria : String;
    fboprodutoobservacao : String;
    fboprodutolote : String;
    fboprodutohora : String;
    fboprodutodimensao : String;
    fboprodutobag : String;
    fboprodutoobrigatorio : String;
    fboprodutostatus : String;
    fboprodutocopiarlote : String;
    fboprodutoaddqtproducaoqtconsumo : String;
    fboprodutoncm : String;
    fboprodutocdunidade : String;
    fboprodutocopiarcddigitado : String;
    fboprodutocopiardimensional : String;
    fboprodutoqtitem : String;
    fboprodutomateriaprima : String;
    fboapontamento : String;
    fboapontamentotphoraextra : String;
    fboapontamentovlunitario : String;
    fboapontamentoalterarvlunitario : String;
    fboapontamentovltotal : String;
    fboapontamentoproducao : String;
    fboapontamentonuestrutural : String;
    fboapontamentodtemissao : String;
    fboapontamentoobservacao : String;
    fboapontamentofuncionario : String;
    fboapontamentohorimetro : String;
    fboapontamentoprodutoacabado : String;
    fcdfuncionario : integer;
    fcdequipamento: integer;
    fbooutros: String;
    fboequipamento : String;
    fboequipamento2 : String;
    fbotpmotivorevisao : String;
    fbomunicipio : String;
    fboprvinstalacao : String;
    fbomaterialnuestrutural: String;
    fboentradaestoque: String;
    Fcdtpordproducao: integer;
    Fboitordproducaogerarmovto: string;
    Fcdstordproducaoitordproducao: integer;
    Fcdstordproducaoitordproducaomat: integer;
    foapontamentodatahora: string;
    fboprodutocopiarmateriaprima: string;
    fboapontamentocntcusto: string;
  public
    [keyfield]
    property cdtpordproducao : integer read Fcdtpordproducao write Fcdtpordproducao;
    [fk]
    property cdfuncionarioresponsavel : integer read fcdfuncionarioresponsavel write fcdfuncionarioresponsavel;
    property bogerarcorte: String read fbogerarcorte write fbogerarcorte;
    [fk]
    property cdprodutocorte : integer read fcdprodutocorte write fcdprodutocorte;
    [fk]
    property cdstordproducaoeventoemail : integer read fcdstordproducaoeventoemail write fcdstordproducaoeventoemail;
    [fk]
    property cdeventoemailstordproducao : integer read fcdeventoemailstordproducao write fcdeventoemailstordproducao;
    [fk]
    property cdstordproducaomapaproducao : integer read fcdstordproducaomapaproducao write fcdstordproducaomapaproducao;
    [fk]
    property cdstordproducaogerarestoque : integer read fcdstordproducaogerarestoque write fcdstordproducaogerarestoque;
    property boformpesagem : String read fboformpesagem write fboformpesagem;
    property botag : String read fbotag write fbotag;
    property boentrada : String read fboentrada write fboentrada;
    property boformulacao : String read fboformulacao write fboformulacao;
    property boqtpeca : String read fboqtpeca write fboqtpeca;
    property boproduto : String read fboproduto write fboproduto;
    property boprodutobuscarestoque : String read fboprodutobuscarestoque write fboprodutobuscarestoque;
    property boconsulta : String read fboconsulta write fboconsulta;
    property bocusto : String read fbocusto write fbocusto;
    property bopedido : String read fbopedido write fbopedido;
    property botpequipamento : String read fbotpequipamento write fbotpequipamento;
    property boarquivo : String read fboarquivo write fboarquivo;
    property bodsdesenho : String read fbodsdesenho write fbodsdesenho;
    property bonuestrutural : String read fbonuestrutural write fbonuestrutural;
    property bodtentrega : String read fbodtentrega write fbodtentrega;
    property bodtprevisao : String read fbodtprevisao write fbodtprevisao;
    property bohistoricostatusmanual : String read fbohistoricostatusmanual write fbohistoricostatusmanual;
    property bomaterial : String read fbomaterial write fbomaterial;
    property bomaterialbaixarestoque : String read fbomaterialbaixarestoque write fbomaterialbaixarestoque;
    property bomaterialfaixa : String read fbomaterialfaixa write fbomaterialfaixa;
    property bogerarrim : String read fbogerarrim write fbogerarrim;
    property bogerarcotacao : String read fbogerarcotacao write fbogerarcotacao;
    property bomaterialnumistura : String read fbomaterialnumistura write fbomaterialnumistura;
    property bomaterialicms : String read fbomaterialicms write fbomaterialicms;
    property bomaterialobservacao : String read fbomaterialobservacao write fbomaterialobservacao;
    property bomaterialprevisao : String read fbomaterialprevisao write fbomaterialprevisao;
    property bomaterialipi : String read fbomaterialipi write fbomaterialipi;
    property bomaterialqtitem : String read fbomaterialqtitem write fbomaterialqtitem;
    property bomaterialcofins : String read fbomaterialcofins write fbomaterialcofins;
    property bomaterialpis : String read fbomaterialpis write fbomaterialpis;
    property bomaterialfrete : String read fbomaterialfrete write fbomaterialfrete;
    property bomaterialnuclfiscal : String read fbomaterialnuclfiscal write fbomaterialnuclfiscal;
    property bomaterialmedida : String read fbomaterialmedida write fbomaterialmedida;
    property bomaterialpsunitario : String read fbomaterialpsunitario write fbomaterialpsunitario;
    property bomaterialnuestrutural : String read fbomaterialnuestrutural write fbomaterialnuestrutural;
    property bomaterialqtconsumo : String read fbomaterialqtconsumo write fbomaterialqtconsumo;
    property bomaterialqtconsumodigitar : String read fbomaterialqtconsumodigitar write fbomaterialqtconsumodigitar;
    property bomaterialposicao : String read fbomaterialposicao write fbomaterialposicao;
    property bomaterialqtestoque : String read fbomaterialqtestoque write fbomaterialqtestoque;
    property bomaterialqtpeca : String read fbomaterialqtpeca write fbomaterialqtpeca;
    property bomaterialvalor : String read fbomaterialvalor write fbomaterialvalor;
    property bomaterialformulacao : String read fbomaterialformulacao write fbomaterialformulacao;
    property bomaterialbag : String read fbomaterialbag write fbomaterialbag;
    property bomateriallote : String read fbomateriallote write fbomateriallote;
    property bomaterialvlfinal : String read fbomaterialvlfinal write fbomaterialvlfinal;
    property botpduracao : String read fbotpduracao write fbotpduracao;
    property bopreparacao : String read fbopreparacao write fbopreparacao;
    property borecurso : String read fborecurso write fborecurso;
    property borecursoformulacao : String read fborecursoformulacao write fborecursoformulacao;
    property borecursoterminoprevista : String read fborecursoterminoprevista write fborecursoterminoprevista;
    property borecursoliberacao : String read fborecursoliberacao write fborecursoliberacao;
    property borecursoinicio : String read fborecursoinicio write fborecursoinicio;
    property boprodutoacabado : String read fboprodutoacabado write fboprodutoacabado;
    property boprodutoqtproducao : String read fboprodutoqtproducao write fboprodutoqtproducao;
    property boprodutosimilarmateria : String read fboprodutosimilarmateria write fboprodutosimilarmateria;
    property boprodutoobservacao : String read fboprodutoobservacao write fboprodutoobservacao;
    property boprodutolote : String read fboprodutolote write fboprodutolote;
    property boprodutohora : String read fboprodutohora write fboprodutohora;
    property boprodutodimensao : String read fboprodutodimensao write fboprodutodimensao;
    property boprodutobag : String read fboprodutobag write fboprodutobag;
    property boprodutoobrigatorio : String read fboprodutoobrigatorio write fboprodutoobrigatorio;
    property boprodutostatus : String read fboprodutostatus write fboprodutostatus;
    property boprodutocopiarlote : String read fboprodutocopiarlote write fboprodutocopiarlote;
    property boprodutoaddqtproducaoqtconsumo : String read fboprodutoaddqtproducaoqtconsumo write fboprodutoaddqtproducaoqtconsumo;
    property boprodutoncm : String read fboprodutoncm write fboprodutoncm;
    property boprodutocdunidade : String read fboprodutocdunidade write fboprodutocdunidade;
    property boprodutocopiarcddigitado : String read fboprodutocopiarcddigitado write fboprodutocopiarcddigitado;
    property boprodutocopiardimensional : String read fboprodutocopiardimensional write fboprodutocopiardimensional;
    property boprodutoqtitem : String read fboprodutoqtitem write fboprodutoqtitem;
    property boprodutomateriaprima : String read fboprodutomateriaprima write fboprodutomateriaprima;
    property boapontamento : String read fboapontamento write fboapontamento;
    property boapontamentotphoraextra : String read fboapontamentotphoraextra write fboapontamentotphoraextra;
    property boapontamentovlunitario : String read fboapontamentovlunitario write fboapontamentovlunitario;
    property boapontamentoalterarvlunitario : String read fboapontamentoalterarvlunitario write fboapontamentoalterarvlunitario;
    property boapontamentovltotal : String read fboapontamentovltotal write fboapontamentovltotal;
    property boapontamentoproducao : String read fboapontamentoproducao write fboapontamentoproducao;
    property boapontamentonuestrutural : String read fboapontamentonuestrutural write fboapontamentonuestrutural;
    property boapontamentodtemissao : String read fboapontamentodtemissao write fboapontamentodtemissao;
    property boapontamentoobservacao : String read fboapontamentoobservacao write fboapontamentoobservacao;
    property boapontamentofuncionario : String read fboapontamentofuncionario write fboapontamentofuncionario;
    property boapontamentocntcusto: string read fboapontamentocntcusto write fboapontamentocntcusto;
    property boapontamentohorimetro : String read fboapontamentohorimetro write fboapontamentohorimetro;
    property boapontamentoprodutoacabado : String read fboapontamentoprodutoacabado write fboapontamentoprodutoacabado;
    [fk]
    property cdfuncionario : integer read fcdfuncionario write fcdfuncionario;
    [fk]
    property cdequipamento: integer read fcdequipamento write fcdequipamento;
    property booutros: String read fbooutros write fbooutros;
    property boequipamento : String read fboequipamento write fboequipamento;
    property boequipamento2 : String read fboequipamento2 write fboequipamento2;
    property botpmotivorevisao : String read fbotpmotivorevisao write fbotpmotivorevisao;
    property bomunicipio : String read fbomunicipio write fbomunicipio;
    property boprvinstalacao : String read fboprvinstalacao write fboprvinstalacao;
    property boentradaestoque : String read fboentradaestoque write fboentradaestoque;
    property boitordproducaogerarmovto : string read Fboitordproducaogerarmovto write Fboitordproducaogerarmovto;
    [fk]
    property cdstordproducaoitordproducao : integer read Fcdstordproducaoitordproducao write Fcdstordproducaoitordproducao;
    [fk]
    property cdstordproducaoitordproducaomat : integer read Fcdstordproducaoitordproducaomat write Fcdstordproducaoitordproducaomat;
    property boapontamentodatahora : string read foapontamentodatahora write foapontamentodatahora;
    property boprodutocopiarmateriaprima : string read fboprodutocopiarmateriaprima write fboprodutocopiarmateriaprima;
    class function getCdtpordproducaopesagem: integer;
  end;

implementation

class function TTpOrdproducao.getCdtpordproducaopesagem: integer;
begin
  result := RetornaSQLInteger('select cdtpordproducao from tpordproducao where boformulacao=''S'' and cdempresa='+empresa.cdempresa.tostring);
end;

end.
