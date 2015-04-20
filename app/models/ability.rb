class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities 
   user ||= User.new
                             if user.admin? #|| user.is? :admin
                                can :manage, :all#, :id => user.id
                                can :assign_roles, User if user.admin?
                                can :manage, :all if user.is? :admin
                                
                               
                                #can [:destroy], Job do |j| 
                                  #j.customer.user == user
                                #end
                                #can :read, Job
                            
    ## => 

          elsif user.is? :applicant
                can [:update,:destroy, :read], [Applicant, Phone, Address] do |j|     
                                   j.user == user
                                end
                 can [:create], [Applicant, Phone, Profile, Address, ApplicantJob] if user.is? :applicant
                    
                        can [:update,:destroy, :read], [Profile, ApplicantJob] do |j| 
                                   j.applicant.user == user
                                end

           elsif user.is? :customer
                can [:destroy, :update] , Job, :id => user.id #, :customer_id => user.customer.id    # Foi foda cancan do capeta
                can :create, [Job, Address, Phone, Customer] if user.is? :customer
                can [:update,:destroy, :read], [Customer, Phone, Address] do |j|     
                                   j.user == user
                                end
                can :jobs_list, Job if user.is? :customer
            else
    
       
                          
                        can :read, [Job] if user.is? [:default]
                            cannot :manage, :all if user.is? :banned
                                #can :read Job, if user.nil?
              end
  end
end

