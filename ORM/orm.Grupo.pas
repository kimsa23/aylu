unit orm.Grupo;

interface

uses Classe.DAO;

type
  TGrupo = class(TRegistroQuipos)
  private
    fcdgrupo : integer;
    fcdorigem : string;
    fcdtpproduto : Integer;
    fcdgrupopai : Integer;
    fcdtpitem : string;
    fcdunidade : integer;
    fnusticms : string;
    fcdmaterial : Integer;
    fcdnaturezaconta : string;
    fcdindicadortpconta : string;
    fcdregrast : integer;
    fcdtpcomissaoproduto : Integer;
    fcdforma : Integer;
    fcdnorma : integer;
    fnmgrupo : string;
    fnunivel : string;
    fcditem : integer;
    fborecuperaipi : string;
    fborecuperaicms : string;
    fborecuperapis : string;
    fborecuperacofins : string;
    fboipi : string;
    fboicms : string;
    fbopis : string;
    fbocofins : string;
    falipi : double;
    falicms : double;
    falpis : double;
    falcofins : double;
    fbogerarlivroproducao : string;
    fnuclfiscal : string;
    fnucontaestoque : integer;
    fbopdv : string;
    fnucontaativo : integer;
    fcdcontaativo : string;
    fnmcontaativo : string;
    fbocomissao : string;
    fprcomissao : double;
    fboproduto : string;
    fbompdobem : string;
    fvlmpdobem : Currency;
    fbosaida : string;
    fboentrada : string;
    fboordcompra : string;
    fbopedido : string;
    fboorcamento : string;
    fboordserv : string;
    fbomovto : string;
    fbopedidomaterial : string;
    fnudiasvencimento : Integer;
    fbodesativarprodutozerado : string;
    fcdbccalculocredito: string;
    fnustpis: string;
    fnustcofins: string;
  public
    [keyfield]
    property cdgrupo : integer read fcdgrupo write fcdgrupo;
    [fk]
    property cdorigem : string read fcdorigem write fcdorigem;
    [fk]
    property cdtpproduto : Integer read fcdtpproduto write fcdtpproduto;
    [fk]
    property cdgrupopai : Integer read fcdgrupopai write fcdgrupopai;
    [fk]
    property cdtpitem : string read fcdtpitem write fcdtpitem;
    [fk]
    property cdunidade : integer read fcdunidade write fcdunidade;
    [fk]
    property nusticms : string read fnusticms write fnusticms;
    [fk]
    property cdmaterial : Integer read fcdmaterial write fcdmaterial;
    [fk]
    property cdnaturezaconta : string read fcdnaturezaconta write fcdnaturezaconta;
    [fk]
    property cdindicadortpconta : string read fcdindicadortpconta write fcdindicadortpconta;
    [fk]
    property cdregrast : integer read fcdregrast write fcdregrast;
    [fk]
    property cdtpcomissaoproduto : Integer read fcdtpcomissaoproduto write fcdtpcomissaoproduto;
    [fk]
    property cdforma : Integer read fcdforma write fcdforma;
    [fk]
    property cdnorma : integer read fcdnorma write fcdnorma;
    [FK]
    property cdbccalculocredito : string read fcdbccalculocredito write fcdbccalculocredito;
    [FK]
    property nustpis : string read fnustpis write fnustpis;
    [FK]
    property nustcofins : string read fnustcofins write fnustcofins;
    property nmgrupo : string read fnmgrupo write fnmgrupo;
    property nunivel : string read fnunivel write fnunivel;
    property cditem : integer read fcditem write fcditem;
    property borecuperaipi : string read fborecuperaipi write fborecuperaipi;
    property borecuperaicms : string read fborecuperaicms write fborecuperaicms;
    property borecuperapis : string read fborecuperapis write fborecuperapis;
    property borecuperacofins : string read fborecuperacofins write fborecuperacofins;
    property boipi : string read fboipi write fboipi;
    property boicms : string read fboicms write fboicms;
    property bopis : string read fbopis write fbopis;
    property bocofins : string read fbocofins write fbocofins;
    property alipi : double read falipi write falipi;
    property alicms : double read falicms write falicms;
    property alpis : double read falpis write falpis;
    property alcofins : double read falcofins write falcofins;
    property bogerarlivroproducao : string read fbogerarlivroproducao write fbogerarlivroproducao;
    property nuclfiscal : string read fnuclfiscal write fnuclfiscal;
    property nucontaestoque : integer read fnucontaestoque write fnucontaestoque;
    property bopdv : string read fbopdv write fbopdv;
    property nucontaativo : integer read fnucontaativo write fnucontaativo;
    property cdcontaativo : string read fcdcontaativo write fcdcontaativo;
    property nmcontaativo : string read fnmcontaativo write fnmcontaativo;
    property bocomissao : string read fbocomissao write fbocomissao;
    property prcomissao : double read fprcomissao write fprcomissao;
    property boproduto : string read fboproduto write fboproduto;
    property bompdobem : string read fbompdobem write fbompdobem;
    property vlmpdobem : Currency read fvlmpdobem write fvlmpdobem;
    property bosaida : string read fbosaida write fbosaida;
    property boentrada : string read fboentrada write fboentrada;
    property boordcompra : string read fboordcompra write fboordcompra;
    property bopedido : string read fbopedido write fbopedido;
    property boorcamento : string read fboorcamento write fboorcamento;
    property boordserv : string read fboordserv write fboordserv;
    property bomovto : string read fbomovto write fbomovto;
    property bopedidomaterial : string read fbopedidomaterial write fbopedidomaterial;
    property nudiasvencimento : Integer read fnudiasvencimento write fnudiasvencimento;
    property bodesativarprodutozerado : string read fbodesativarprodutozerado write fbodesativarprodutozerado;
  end;

implementation

end.
