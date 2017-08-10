class LogsController < ApplicationController
 def index
      @log = Log.new()
      @logs = Log.order(date: :desc)
      @total_calorie_breakfast = breakfast_calorie
      @total_calorie_lunch = lunch_calorie
      @total_calorie_dinner = dinner_calorie
  end
  
  def create
     l= Log.new(params[:log].permit(:date, :category, :name, :servings, :calories_per_serving))
      l.save
      redirect_to logs_url
  end
  
  
  def edit
    l = Log.find(params[:id])
    @logs = Log.order(date: :desc)
    @log = l
    render 'index'
  end
  

  def update
      l = Log.find(params[:id])
      l.update(params[:log].permit(:date, :category, :name, :servings, :calories_per_serving))
      redirect_to logs_url
  end
  
  def destroy
      l = Log.find(params[:id])
      l.destroy
      redirect_to logs_url
  end
  
  def breakfast_calorie
        t=0
        @logs.each do |i|
            if i.category == 'Breakfast'
                t += (i.servings * i.calories_per_serving)
            end
            
        end
        return t
    end
    
  def lunch_calorie
        t = 0
        @logs.each do |i|
            if i.category == 'Lunch'
               t += (i.servings * i.calories_per_serving)
            end
        end
        return t
    end

  def dinner_calorie
        t =0
        @logs.each do |i|
            if i.category == 'Dinner'
               t += (i.servings * i.calories_per_serving)
            end
        
        end
        return t
    end
    
end