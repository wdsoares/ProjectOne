require 'test_helper'

class ProdutoimagemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @produtoimagem = produtoimagems(:one)
  end

  test "should get index" do
    get produtoimagems_url
    assert_response :success
  end

  test "should get new" do
    get new_produtoimagem_url
    assert_response :success
  end

  test "should create produtoimagem" do
    assert_difference('Produtoimagem.count') do
      post produtoimagems_url, params: { produtoimagem: { idproduto: @produtoimagem.idproduto, imagem: @produtoimagem.imagem } }
    end

    assert_redirected_to produtoimagem_url(Produtoimagem.last)
  end

  test "should show produtoimagem" do
    get produtoimagem_url(@produtoimagem)
    assert_response :success
  end

  test "should get edit" do
    get edit_produtoimagem_url(@produtoimagem)
    assert_response :success
  end

  test "should update produtoimagem" do
    patch produtoimagem_url(@produtoimagem), params: { produtoimagem: { idproduto: @produtoimagem.idproduto, imagem: @produtoimagem.imagem } }
    assert_redirected_to produtoimagem_url(@produtoimagem)
  end

  test "should destroy produtoimagem" do
    assert_difference('Produtoimagem.count', -1) do
      delete produtoimagem_url(@produtoimagem)
    end

    assert_redirected_to produtoimagems_url
  end
end
