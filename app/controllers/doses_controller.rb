class DosesController < ApplicationController

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    # on garde en memoire cocktail pour ajouter notre dose
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render "cocktails/show"
    end
  end

  def destroy
    @dose.destroy
    redirect_to doses_path
  end

  private

  def dose_params
    # ds le form on va retrouver description
    # et ingredients (pas de cocktails vu qu'on est deja dessus)
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
