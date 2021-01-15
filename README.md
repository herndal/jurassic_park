# README

# 1: A curiosity about boolean validations
Is there a good way to test this? Or is it just unnecessary?
Cage model:
validates_inclusion_of :is_active, in: [true, false]
Cage model spec:
it { should validate_inclusion_of(:is_active).in_array([true, false]) }
Shoulda-matchers warning:
************************************************************************
Warning from shoulda-matchers:

You are using `validate_inclusion_of` to assert that a boolean column
allows boolean values and disallows non-boolean ones. Be aware that it
is not possible to fully test this, as boolean columns will
automatically convert non-boolean values to boolean ones. Hence, you
should consider removing this test.
************************************************************************

# 2: Filtering queries with parameters
My quick solution for filtering dinosaurs by species is like so:

  def index
    if params[:species]
      @api_dinosaurs = Dinosaur.where(species: params[:species])
    else
      @api_dinosaurs = Dinosaur.all
    end
  end

I cannot help but imagine that there must be a better generic way to do this, to filter by any and all parameters passed in that are relevant to the model. I will look into that after delivering this.