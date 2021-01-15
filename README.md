# README

## Concurrency
Up to this point, my only experience writing non-blocking code is with JavaScript, for the purpose of a smooth user experience, using tools like Axios and Jquery. I understand the value of multithreaded server-side request handling, and I'd like to learn more about it. From preliminary research, I understand there is a Ruby concurrency gem that allows you to execute promises and callbacks.
I would look first to implement these things everywhere I am clearly reading and writing to the database; in controller actions and in model methods, especially the ones that deal with multiple records like dinosaur.move and cage.power_off.

I understand that Puma servers are multi-threaded by nature. Creating concurrent ruby threads within each of concurrent requests would result in M x N database connections being attempted simultaneously. I believe this could be overwhelming if left unmanaged, and also could ruin the integrity of database records if multiple writes happen simultaneously to the same records or even just the same tables. I honestly don't know enough about how this can be managed and tested, but I would like to know more. Until then, I believe in safety over speed.

## Notes

### Boolean validations
Is there a good way to test this? Or is it just unnecessary? I had it in, but after reading shoulda-matchers warning, I removed it.
  Cage model:
```
validates_inclusion_of :is_active, in: [true, false]
```
  Cage model spec:
```
it { should validate_inclusion_of(:is_active).in_array([true, false]) }
```
************************************************************************
Warning from shoulda-matchers:

You are using `validate_inclusion_of` to assert that a boolean column
allows boolean values and disallows non-boolean ones. Be aware that it
is not possible to fully test this, as boolean columns will
automatically convert non-boolean values to boolean ones. Hence, you
should consider removing this test.
************************************************************************

### Filtering queries with parameters
My quick solution for filtering dinosaurs by species is like so:

  def index
    if params[:species]
      @api_dinosaurs = Dinosaur.where(species: params[:species])
    else
      @api_dinosaurs = Dinosaur.all
    end
  end

I cannot help but imagine that there must be a better generic way to do this, to filter by any and all parameters passed in that are relevant to the model. I will look into that after delivering this.