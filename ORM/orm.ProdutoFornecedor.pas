unit orm.ProdutoFornecedor;

interface

uses Data.DB,
  Classe.DAO;

type
  TProdutoFornecedor = class(TRegistroQuipos)
  private
    Fcdprodutofornecedor: integer;
    Fcdproduto: integer;
    Fcdprodutofornecedorinterno: string;
    Fcdfornecedor: Largeint;
  public
    [keyfield]
    property cdprodutofornecedor : integer read Fcdprodutofornecedor write Fcdprodutofornecedor;
    [fk]
    property cdproduto : integer read Fcdproduto write Fcdproduto;
    [fk]
    property cdfornecedor : largeint read Fcdfornecedor write Fcdfornecedor;
    property cdprodutofornecedorinterno : string read Fcdprodutofornecedorinterno write Fcdprodutofornecedorinterno;
  end;

implementation

end.
