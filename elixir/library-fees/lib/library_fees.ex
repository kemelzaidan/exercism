defmodule LibraryFees do
  def datetime_from_string(iso8601_str) do
    {:ok, naivedatetime} = NaiveDateTime.from_iso8601(iso8601_str)
    naivedatetime
  end

  def before_noon?(datetime) do
    {:ok, naivedatetime} =
      NaiveDateTime.new(datetime.year, datetime.month, datetime.day, 12, 0, 0)

    noom = naivedatetime

    case NaiveDateTime.compare(datetime, noom) do
      :gt -> false
      :lt -> true
      :eq -> false
    end
  end

  def return_date(checkout_datetime) do
    beforenoom? = before_noon?(checkout_datetime)

    case beforenoom? do
      true -> NaiveDateTime.shift(checkout_datetime, day: 28) |> NaiveDateTime.to_date()
      false -> NaiveDateTime.shift(checkout_datetime, day: 29) |> NaiveDateTime.to_date()
    end
  end

  def days_late(planned_return_date, actual_return_datetime) do
    actual_return_date = NaiveDateTime.to_date(actual_return_datetime)
    days = Date.diff(actual_return_date, planned_return_date)

    if days > 0 do
      days
    else
      0
    end
  end

  def monday?(datetime) do
    date = NaiveDateTime.to_date(datetime)

    if Date.day_of_week(date) == 1 do
      true
    else
      false
    end
  end

  def calculate_late_fee(checkout, return, rate) do
    naive_checkout = datetime_from_string(checkout)
    naive_return = datetime_from_string(return)
    is_monday? = monday?(naive_return)
    returndate = return_date(naive_checkout)
    dayslate = days_late(returndate, naive_return)

    if is_monday? === true do
      (dayslate * rate * 0.5) |> floor()
    else
      dayslate * rate
    end
  end
end
