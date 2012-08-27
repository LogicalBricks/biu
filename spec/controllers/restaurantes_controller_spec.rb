require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe RestaurantesController do

  # This should return the minimal set of attributes required to create a valid
  # Restaurante. As you add validations to Restaurante, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {
      nombre: 'a restaurant name',
      resumen: 'a restaurant abstract',
      descripcion: 'a restaurant description',
      clasificacion: 3
    }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # RestaurantesController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all restaurantes as @restaurantes" do
      restaurante = Restaurante.create! valid_attributes
      get :index, {}, valid_session
      assigns(:restaurantes).should eq([restaurante])
    end
  end

  describe "GET show" do
    it "assigns the requested restaurante as @restaurante" do
      restaurante = Restaurante.create! valid_attributes
      get :show, {:id => restaurante.to_param}, valid_session
      assigns(:restaurante).should eq(restaurante)
    end
  end

  describe "GET new" do
    it "assigns a new restaurante as @restaurante" do
      get :new, {}, valid_session
      assigns(:restaurante).should be_a_new(Restaurante)
    end
  end

  describe "GET edit" do
    it "assigns the requested restaurante as @restaurante" do
      restaurante = Restaurante.create! valid_attributes
      get :edit, {:id => restaurante.to_param}, valid_session
      assigns(:restaurante).should eq(restaurante)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Restaurante" do
        expect {
          post :create, {:restaurante => valid_attributes}, valid_session
        }.to change(Restaurante, :count).by(1)
      end

      it "assigns a newly created restaurante as @restaurante" do
        post :create, {:restaurante => valid_attributes}, valid_session
        assigns(:restaurante).should be_a(Restaurante)
        assigns(:restaurante).should be_persisted
      end

      it "redirects to the created restaurante" do
        post :create, {:restaurante => valid_attributes}, valid_session
        response.should redirect_to(Restaurante.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved restaurante as @restaurante" do
        # Trigger the behavior that occurs when invalid params are submitted
        Restaurante.any_instance.stub(:save).and_return(false)
        post :create, {:restaurante => {}}, valid_session
        assigns(:restaurante).should be_a_new(Restaurante)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Restaurante.any_instance.stub(:save).and_return(false)
        post :create, {:restaurante => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested restaurante" do
        restaurante = Restaurante.create! valid_attributes
        # Assuming there are no other restaurantes in the database, this
        # specifies that the Restaurante created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Restaurante.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => restaurante.to_param, :restaurante => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested restaurante as @restaurante" do
        restaurante = Restaurante.create! valid_attributes
        put :update, {:id => restaurante.to_param, :restaurante => valid_attributes}, valid_session
        assigns(:restaurante).should eq(restaurante)
      end

      it "redirects to the restaurante" do
        restaurante = Restaurante.create! valid_attributes
        put :update, {:id => restaurante.to_param, :restaurante => valid_attributes}, valid_session
        response.should redirect_to(restaurante)
      end
    end

    describe "with invalid params" do
      it "assigns the restaurante as @restaurante" do
        restaurante = Restaurante.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Restaurante.any_instance.stub(:save).and_return(false)
        put :update, {:id => restaurante.to_param, :restaurante => {}}, valid_session
        assigns(:restaurante).should eq(restaurante)
      end

      it "re-renders the 'edit' template" do
        restaurante = Restaurante.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Restaurante.any_instance.stub(:save).and_return(false)
        put :update, {:id => restaurante.to_param, :restaurante => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested restaurante" do
      restaurante = Restaurante.create! valid_attributes
      expect {
        delete :destroy, {:id => restaurante.to_param}, valid_session
      }.to change(Restaurante, :count).by(-1)
    end

    it "redirects to the restaurantes list" do
      restaurante = Restaurante.create! valid_attributes
      delete :destroy, {:id => restaurante.to_param}, valid_session
      response.should redirect_to(restaurantes_url)
    end
  end

end
