unit orm.TpPedidoMaterial;

interface

uses Classe.DAO;

type
  TTpPedidoMaterial = class(TRegistroQuipos)
  private
    Fboqtitem: string;
    Fboaplicacaodigitar: string;
    Fbofinalidade: string;
    Fboemergencia: string;
    Fbocntcustoobrigatorio: string;
    Fbovendedor: string;
    Fboitemqtpeca: string;
    Fbotpfornecedor: string;
    Fbocomprador: string;
    Fbofornecedorexclusivo: string;
    Fboordproducao: string;
    Fvllimite: Currency;
    Fcdtppedidomaterial: Integer;
    Fqtfornecedor: Integer;
    Fnmtppedidomaterial: string;
    Fdsmensagem: string;
    Fbojustificarmudancastatus: string;
    fcdeventoemail: integer;
  public
    [keyfield]
    property cdtppedidomaterial : Integer read Fcdtppedidomaterial write fcdtppedidomaterial;
    [FK]
    property cdeventoemail: integer read fcdeventoemail write fcdeventoemail;
    property nmtppedidomaterial : string read Fnmtppedidomaterial write fnmtppedidomaterial;
    property vllimite : Currency read Fvllimite write fvllimite;
    property qtfornecedor : Integer read Fqtfornecedor write fqtfornecedor;
    property bofornecedorexclusivo : string read Fbofornecedorexclusivo write fbofornecedorexclusivo;
    property boaplicacaodigitar : string read Fboaplicacaodigitar write fboaplicacaodigitar;
    property dsmensagem : string read Fdsmensagem write fdsmensagem;
    property boqtitem : string read Fboqtitem write fboqtitem;
    property bofinalidade : string read Fbofinalidade write fbofinalidade;
    property botpfornecedor : string read Fbotpfornecedor write fbotpfornecedor;
    property bocomprador : string read Fbocomprador write fbocomprador;
    property bovendedor : string read Fbovendedor write fbovendedor;
    property bocntcustoobrigatorio : string read Fbocntcustoobrigatorio write fbocntcustoobrigatorio;
    property boitemqtpeca : string read Fboitemqtpeca write fboitemqtpeca;
    property boordproducao : string read Fboordproducao write fboordproducao;
    property boemergencia : string read Fboemergencia write fboemergencia;
    property bojustificarmudancastatus : string read Fbojustificarmudancastatus write Fbojustificarmudancastatus;
  end;

implementation

end.
