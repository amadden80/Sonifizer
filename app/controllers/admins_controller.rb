
class AdminsController < ApplicationController

    before_filter :authenticate_admin!

    def admin_console
        @requesters = Requester.all
    end

end