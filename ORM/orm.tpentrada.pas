unit orm.tpentrada;

interface

uses System.SysUtils,
  uConstantes,
  ORM.Empresa, orm.STICMS,
  Classe.DAO;

type
  TTpEntrada = class(TRegistroQuipos)
  private
    Fboipi: String;
    Fbomarkup: String;
    Fboretencaopis: String;
    Fboretencaocofins: String;
    Fboretencaoinss: String;
    Fboretencaoirrf: String;
    Fboplconta: String;
    Fboordproducao: String;
    Fboautpagto: String;
    Fboestoque: String;
    Fboinsercaocdbarra: String;
    Fboicmssubst: String;
    Fbopis: String;
    Fbocalcedtrib: String;
    Fbodescricaoitens: String;
    Fbocofinsret: String;
    Fboretencaoiss: String;
    Fbofrete: String;
    Fbopisret: String;
    Fbodtfabricacao: String;
    Fbocofins: String;
    Fboicms: String;
    Fbocntcusto: String;
    Fbodtvalidade: String;
    Fboipibcicms: String;
    Fbodigitado: String;
    Fbodshistoriconf: String;
    Fboordcompra: String;
    Fboretencaocontribsocial: String;
    Fbolucro: String;
    Fboinfadicional: String;
    Fcdcfopdufsubtrib: integer;
    Fcdcfopduf: integer;
    Fcdtpentrada: integer;
    Fcdcfopfuf: integer;
    Fcdcfopfufsubtrib: integer;
    Ftpforncliente: string;
    Fnmtpentrada: string;
    Fnudocfiscalicms: string;
    Fnmreduzido: string;
  public
    [keyfield]
    property cdtpentrada : integer read Fcdtpentrada write Fcdtpentrada;
    [fk]
    property cdcfopfuf : integer read Fcdcfopfuf write Fcdcfopfuf;
    [fk]
    property cdcfopduf : integer read Fcdcfopduf write Fcdcfopduf;
    [fk]
    property cdcfopfufsubtrib : integer read Fcdcfopfufsubtrib write Fcdcfopfufsubtrib;
    [fk]
    property cdcfopdufsubtrib : integer read Fcdcfopdufsubtrib write Fcdcfopdufsubtrib;
    property nudocfiscalicms : string read Fnudocfiscalicms write Fnudocfiscalicms;
    property nmtpentrada : string read Fnmtpentrada write Fnmtpentrada;
    property nmreduzido : string read Fnmreduzido write Fnmreduzido;
    property boicms : String read Fboicms write Fboicms;
    property boipi : String read Fboipi write Fboipi;
    property tpforncliente : string read Ftpforncliente write Ftpforncliente;
    property boautpagto : String read Fboautpagto write Fboautpagto;
    property boestoque : String read Fboestoque write Fboestoque;
    property bocntcusto : String read Fbocntcusto write Fbocntcusto;
    property boicmssubst : String read Fboicmssubst write Fboicmssubst;
    property bocofins : String read Fbocofins write Fbocofins;
    property bopis : String read Fbopis write Fbopis;
    property bofrete : String read Fbofrete write Fbofrete;
    property bocalcedtrib : String read Fbocalcedtrib write Fbocalcedtrib;
    property bodtfabricacao : String read Fbodtfabricacao write Fbodtfabricacao;
    property bodtvalidade : String read Fbodtvalidade write Fbodtvalidade;
    property bodescricaoitens : String read Fbodescricaoitens write Fbodescricaoitens;
    property bodigitado : String read Fbodigitado write Fbodigitado;
    property boipibcicms : String read Fboipibcicms write Fboipibcicms;
    property bolucro : String read Fbolucro write Fbolucro;
    property bodshistoriconf : String read Fbodshistoriconf write Fbodshistoriconf;
    property boinsercaocdbarra : String read Fboinsercaocdbarra write Fboinsercaocdbarra;
    property boretencaocofins : String read Fboretencaocofins write Fboretencaocofins;
    property boretencaopis : String read Fboretencaopis write Fboretencaopis;
    property boretencaocontribsocial : String read Fboretencaocontribsocial write Fboretencaocontribsocial;
    property boretencaoinss : String read Fboretencaoinss write Fboretencaoinss;
    property boretencaoiss : String read Fboretencaoiss write Fboretencaoiss;
    property boretencaoirrf : String read Fboretencaoirrf write Fboretencaoirrf;
    property bocofinsret : String read Fbocofinsret write Fbocofinsret;
    property bopisret : String read Fbopisret write Fbopisret;
    property boordcompra : String read Fboordcompra write Fboordcompra;
    property bomarkup : String read Fbomarkup write Fbomarkup;
    property boinfadicional : String read Fboinfadicional write Fboinfadicional;
    property boplconta : String read Fboplconta write Fboplconta;
    property boordproducao : String read Fboordproducao write Fboordproducao;
    function getcdcfop(nusticms: string; cduf: integer):integer;
  end;

implementation

function TTpEntrada.getcdcfop(nusticms: string; cduf: integer): integer;
var
  sticms : tsticms;
begin
  result := 0;
  if (nusticms = '') or (cduf = 0) then
  begin
    exit;
  end;
  sticms := tsticms.create;
  try
    if not sticms.select(_nusticms+'='+nusticms.QuotedString) then
    begin
      exit;
    end;
    if cduf = empresa.endereco.cduf then
    begin
      if sticms.boicmssubtrib = _s then
      begin
        result := cdcfopdufsubtrib;
      end
      else
      begin
        result := cdcfopduf;
      end;
    end
    else
    begin
      if sticms.boicmssubtrib = _s then
      begin
        result := cdcfopfufsubtrib;
      end
      else
      begin
        result := cdcfopfuf;
      end;
    end;
  finally
    freeandnil(sticms);
  end;
end;

end.
