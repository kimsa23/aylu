unit orm.clfornecedor;

interface

uses Classe.DAO;

type
  Tclfornecedor = class(TPersintentObject)
  private
    Fltclassificacao: string;
    Fnmclfornecedor: string;
    Fvlmaximo: integer;
    Fvlminimo: integer;
    Fcdclfornecedor: integer;
    Fbocredenciado: String;
  public
    [keyfield]
    property cdclfornecedor : integer read Fcdclfornecedor write Fcdclfornecedor;
    property nmclfornecedor : string read Fnmclfornecedor write Fnmclfornecedor;
    property ltclassificacao : string read Fltclassificacao write Fltclassificacao;
    property vlminimo : integer read Fvlminimo write Fvlminimo;
    property vlmaximo : integer read Fvlmaximo write Fvlmaximo;
    property bocredenciado : String read Fbocredenciado write Fbocredenciado;
    function Select(const AValue: Integer):boolean;overload;
  end;

implementation

function Tclfornecedor.Select(const AValue: Integer): boolean;
begin
  cdclfornecedor := avalue;
  result := inherited select;
end;

end.
