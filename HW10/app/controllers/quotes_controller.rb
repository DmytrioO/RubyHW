class QuotesController < InheritedResources::Base

  private

    def quote_params
      params.require(:quote).permit(:name)
    end

end
